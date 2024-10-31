import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screen/user_review_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';

class DetailLayout extends StatefulWidget {
  final String? title;
  final String? productName;
  final String? description;
  final String? price;
  final int? rating;
  final List<String>? categories;
  final Product? product;

  const DetailLayout(
      {super.key,
      this.productName,
      this.description,
      this.categories,
      this.title,
      this.price,
      this.rating,
      this.product});

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  bool isFavorite = false; // Initialize directly
  bool isInCart = false; // Initialize directly

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
          title: Text(
              !isFavorite ? "Removed from Wish list" : "Added to Wish list"),
          content: Text(
              "${product.name} has been ${!isFavorite ? "removed" : "added"} to your wishlist."),
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

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: widget.title ?? '',
        iconRight: [
          Padding(
              padding: EdgeInsets.only(
                  right: 24 * MediaQuery.of(context).size.width / 393),
              child: SvgPicture.asset(AppIcon.botSearch)),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25 * screenWidth / 393),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product!.subcategories!.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // Notify when category is selected
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 30 * screenWidth / 393,
                              left: index == 0 ? 0 : 30 * screenWidth / 393),
                          child: Text(widget.product!.subcategories![index],
                              style: AppTypography.hintText),
                        ),
                      ),
                      if (index < widget.product!.subcategories!.length - 1)
                        const SizedBox(
                          height: 24, // Adjust the height as needed
                          child: VerticalDivider(
                            color: AppColors.salmon,
                            thickness: 1,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 36 * screenHeight / 852),
            Container(
              height: 300 * screenHeight / 852,
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.beige),
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(widget.product!.image)),
            ),
            SizedBox(height: 12 * screenHeight / 852),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget.product!.name,
                  style: AppTypography.cardTextTitle),
            ),
            SizedBox(height: 2 * screenHeight / 852),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                  // description ?? '',
                  'Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.',
                  style: AppTypography.descriptionTitle),
            ),
            const Divider(
              color: AppColors.salmon,
              thickness: 0.8,
            ),
            SizedBox(height: screenHeight * 7 / 852),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${widget.product!.price.toStringAsFixed(2)}',
                    // '\$120.00',
                    style: AppTypography.heading3),
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
                        height: 25 * screenHeight / 852,
                        width: 25 * screenHeight / 852,
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
                        height: 25 * screenHeight / 852,
                        width: 25 * screenHeight / 852,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5 * screenHeight / 852),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          RouteAnimation.fadeRoute(const UserReviewScreen()));
                    },
                    child: const Text('Users review',
                        style: AppTypography.bodyTextDark)),
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Row(
                        children: [
                          SvgPicture.asset(
                            index < 5 - (widget.product?.rating ?? 0)
                                ? AppIcon.whiteStar
                                : AppIcon.star,
                            // ignore: deprecated_member_use
                          ),
                          SizedBox(width: index == 5 ? 0 : 3)
                        ],
                      );
                    })
                  ],
                )
              ],
            ),
            SizedBox(height: 48 * screenHeight / 852),
            Center(
              child: AppButton(
                onPressed: () {
                  addToCart(widget.product!);
                  isInCart = true;
                },
                title: 'Add To Cart',
                textColor: AppColors.terracotta,
                width: 207 * screenWidth / 393,
              ),
            )
          ],
        ),
      )),
    );
  }
}
