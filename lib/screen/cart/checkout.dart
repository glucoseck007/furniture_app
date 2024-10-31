import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/screen/cart/cart_detail.dart';
import 'package:furniture_app/screen/cart/cart_process.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.cartList});

  final List<Cart> cartList;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

enum PaymentMethod { cash, paypal, apple, credit }

class _CheckOutScreenState extends State<CheckOutScreen> {
  PaymentMethod? selectedPaymentMethod = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: 'Check Out',
        iconRight: const [SizedBox(height: 0)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22 * screenWidth / 393,
          vertical: screenHeight * 16 / 852,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShipAdress(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            SizedBox(height: 28 * screenHeight / 852),
            _buildOrderSummary(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            SizedBox(height: 28 * screenHeight / 852),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Text(
                      'Payment Method',
                      style: AppTypography.buttonText,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 147 * screenHeight / 852,
                      width: screenWidth - 47,
                      decoration: BoxDecoration(
                        color: AppColors.beige,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: PaymentMethod.values.map((method) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    Radio<PaymentMethod>(
                                      value: method,
                                      groupValue: selectedPaymentMethod,
                                      activeColor: AppColors.terracotta,
                                      onChanged: (PaymentMethod? value) {
                                        setState(() {
                                          selectedPaymentMethod = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Adjust space between radio and label
                                    Text(
                                      _getPaymentMethodName(method),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkLetter,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 33,
                      child: Container(
                        width: 151 * screenWidth / 393,
                        height: 21 * screenHeight / 852,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          '*** *** *** 67 /00 /000',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.darkLetter),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 110,
                        right: 10,
                        child: SvgPicture.asset(AppIcon.botEdit))
                  ],
                ),
              ],
            ),
            SizedBox(height: 28 * screenHeight / 852),
            _buildDeliveryTime(screenHeight: screenHeight),
            SizedBox(height: 78 * screenHeight / 852),
            Center(
              child: AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      RouteAnimation.fadeRoute(
                          CartProcess(check: true, cartList: cartList)));
                },
                title: 'Pay Now',
                textColor: AppColors.terracotta,
                width: 207 * screenWidth / 393,
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getPaymentMethodName(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cash:
        return 'Cash on Delivery';
      case PaymentMethod.paypal:
        return 'Paypal';
      case PaymentMethod.apple:
        return 'Apple Pay';
      case PaymentMethod.credit:
        return 'Credit Card';
      default:
        return '';
    }
  }
}

class _buildDeliveryTime extends StatelessWidget {
  const _buildDeliveryTime({
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Time',
          style: TextStyle(
              color: AppColors.terracotta,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20 * screenHeight / 852),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Estimated Delivery',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkLetter),
            ),
            Text(
              '1 Hour, 25 Mins',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.salmon),
            )
          ],
        )
      ],
    );
  }
}

class _buildOrderSummary extends StatelessWidget {
  const _buildOrderSummary({
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.carts;
    double totalPrice = cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                color: AppColors.terracotta,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(AppIcon.botEdit),
          ],
        ),
        SizedBox(
          height: 30 * screenHeight / 852,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: cartItems.map((item) {
                return Column(
                  children: [
                    _buildOrderDetail(
                      screenWidth: screenWidth,
                      title: item.product.name,
                      quantity: item.quantity,
                    ),
                    const SizedBox(height: 2),
                  ],
                );
              }).toList(),
            ),
            Text(
              '\$$totalPrice',
              style: const TextStyle(
                color: AppColors.salmon,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _buildOrderDetail extends StatelessWidget {
  const _buildOrderDetail({
    required this.screenWidth,
    required this.title,
    required this.quantity,
  });

  final double screenWidth;
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return SizedBox(
      width: screenWidth * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? AppColors.white : AppColors.darkLetter),
          ),
          Text(
            '$quantity items',
            style: const TextStyle(fontSize: 14, color: AppColors.salmon),
          ),
        ],
      ),
    );
  }
}

class _buildShipAdress extends StatelessWidget {
  const _buildShipAdress({
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shipping Address',
                    style: TextStyle(
                      color: AppColors.terracotta,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(AppIcon.botEdit),
                ],
              ),
              SizedBox(
                height: screenHeight * 12 / 852,
              ),
              Container(
                height: 99 * screenHeight / 852,
                width: screenWidth - 47,
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14 * screenHeight / 852),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kathryn Murphy',
                        style: TextStyle(
                          color: AppColors.terracotta,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '2464 Royal Ln. Mesa, New Jersey 45463',
                        style: TextStyle(
                          color: AppColors.darkLetter,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '(302) 555-0107 - (406) 555-0120',
                        style: TextStyle(
                          color: AppColors.darkLetter,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
