import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/detail_layout.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/models/product.dart';

class CustomCard extends StatefulWidget {
  final Product? product;
  final double? imageHeight;
  final double? imageWidth;
  final double? fontSize;
  final Color? textColor;
  final double cardWidth;
  final double? space;

  const CustomCard({
    this.product,
    this.imageHeight,
    this.imageWidth,
    super.key,
    this.fontSize,
    this.textColor,
    required this.cardWidth,
    this.space,
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false; // Initialize directly
  bool isInCart = false; // Initialize directly

  @override
  void initState() {
    super.initState();
    // Optionally, initialize based on some condition (e.g., checking if the product is already in the wishlist or cart)
    // isFavorite = checkIfFavorite(widget.product);
    // isInCart = checkIfInCart(widget.product);
  }

  void toggleFavorite(Product product) {
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite state
      if (isFavorite) {
        // Add to the wishlist
        print('Product added to the wish list');
      } else {
        // Remove from the wishlist
        print('Product removed from the wish list');
      }
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Added to Wish list"),
          content: Text("${product.name} has been added to your wishlist."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog box
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void addToCart(Product product) {
    setState(() {
      isInCart = true;
    });
    Cart.addCart(product);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Added to Cart"),
          content: Text("${product.name} has been added to your cart."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog box
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget imageWidget = Image.asset(widget.product!.image);

    if (widget.imageHeight != null) {
      imageWidget = Container(
        width: 163 * screenWidth / 393,
        height: 106 * screenHeight / 852,
        decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(
            widget.product!.image,
            width: widget.imageWidth ?? 167,
            height: widget.imageHeight ?? 145,
          ),
        ),
      );
    }

    return SizedBox(
      width: widget.cardWidth * screenWidth / 393,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DetailLayout(
                            product: widget.product,
                          ))),
              child: imageWidget),
          SizedBox(height: widget.space ?? 9 * screenHeight / 852),
          Text(widget.product!.name, style: AppTypography.cardTextTitle),
          SizedBox(height: 2 * screenHeight / 852),
          Text(
            widget.product!.description,
            style: AppTypography.descriptionTitle,
          ),
          const Divider(
            color: AppColors.salmon,
            thickness: 0.8,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 3 * screenWidth / 393,
              left: 3 * screenWidth / 393,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.product!.price.toStringAsFixed(2)}',
                  style: AppTypography.priceTitle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => toggleFavorite(
                          widget.product!), // Handle favorite toggle
                      child: SvgPicture.asset(
                        isFavorite
                            ? AppIcon
                                .offFavorite // Show filled heart if favorite
                            : AppIcon
                                .favorites, // Show outline heart if not favorite
                        height: 19 * screenHeight / 852,
                        width: 19 * screenHeight / 852,
                      ),
                    ),
                    SizedBox(width: screenWidth * 2 / 393),
                    GestureDetector(
                      onTap: () =>
                          addToCart(widget.product!), // Handle adding to cart
                      child: SvgPicture.asset(
                        isInCart
                            ? AppIcon.onAdd // Show the "added to cart" icon
                            : AppIcon.offAdd, // Show the normal add icon
                        height: 19 * screenHeight / 852,
                        width: 19 * screenHeight / 852,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
