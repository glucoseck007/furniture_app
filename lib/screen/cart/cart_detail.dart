import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/layout/holder_layout.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screen/cart/checkout.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:provider/provider.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key, this.product});

  final Product? product;

  @override
  State<CartDetail> createState() => _CartDetailState();
}

List<Cart> cartList = Cart.carts;

// const List<Map<String, dynamic>> cartList = [
//   {
//     'name': 'Serenity Nightstand',
//     'price': 750,
//     'quantity': 1,
//     'image': AppImage.nightstand, // Replace with your asset paths
//   },
//   {
//     'name': 'Bedroom Dresser',
//     'price': 85,
//     'quantity': 2,
//     'image': AppImage.dresser,
//   },
//   {
//     'name': 'Blue Table Lamp',
//     'price': 20,
//     'quantity': 3,
//     'image': AppImage.blueLamp,
//   },
// ];

class _CartDetailState extends State<CartDetail> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    double subtotal = cartList.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));
    double taxAndFees = 5.00;
    double delivery = 0.00;

    double total = subtotal + taxAndFees + delivery;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (cartList.isEmpty) return const HolderLayout(check: true);

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: 'My Cart',
        iconRight: [
          Padding(
            padding: EdgeInsets.only(
                right: 24 * MediaQuery.of(context).size.width / 393),
            child: SvgPicture.asset(AppIcon.botEdit),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 12 / 393),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 21 / 852),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final item = cartList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: AppColors.beige,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Image.asset(
                                      item.product.image,
                                      height: 89,
                                      width: 89,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.name,
                                    style: isDarkMode
                                        ? AppTypography.bodyText
                                        : AppTypography.bodyTextDark,
                                  ),
                                  Text(
                                    '\$${item.product.price}',
                                    style: isDarkMode
                                        ? AppTypography.bodyText
                                        : AppTypography.bodyTextDark,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Cart.removeCart(item.product);
                                    isClicked = true;
                                  });
                                },
                                icon: SvgPicture.asset(
                                  isClicked ? AppIcon.onLess : AppIcon.offLess,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    Cart.addCart(item.product);
                                  });
                                },
                                icon: SvgPicture.asset(
                                  AppIcon.plus,
                                  // ignore: deprecated_member_use
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    _buildSummaryRow('Subtotal', subtotal, screenHeight,
                        screenWidth, isDarkMode),
                    _buildSummaryRow('Tax And Fees', taxAndFees, screenHeight,
                        screenWidth, isDarkMode),
                    _buildSummaryRow('Delivery', delivery, screenHeight,
                        screenWidth, isDarkMode),
                    const Divider(),
                    _buildSummaryRow(
                        'Total', total, screenHeight, screenWidth, isDarkMode,
                        isTotal: true),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 24 / 852),
              AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      RouteAnimation.fadeRoute(CheckOutScreen(
                        cartList: cartList,
                      )));
                },
                textColor: AppColors.white,
                title: 'Check Out',
                width: 207 * screenWidth / 393,
                height: 45 * screenHeight / 852,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, double screenHeight,
      double screenWidth, bool isDarkMode,
      {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4 * screenHeight / 852),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              color: isDarkMode ? AppColors.white : AppColors.darkLetter,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
              color: AppColors.salmon,
            ),
          ),
        ],
      ),
    );
  }
}
