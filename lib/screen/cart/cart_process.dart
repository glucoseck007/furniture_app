import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/animations/loading_animation.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/screen/cart/track_order.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';

class CartProcess extends StatelessWidget {
  final bool check;
  final List<Cart> cartList;

  const CartProcess({super.key, required this.check, required this.cartList});

  @override
  Widget build(BuildContext context) {
    if (check) {
      cartList.clear();
    }

    return Scaffold(
      appBar: CustomAppBar(
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoadingAnimation(), // Fixed Loading Animation without Scaffold
                SizedBox(
                    height: 27.16 * MediaQuery.of(context).size.height / 852),
                check
                    ? Column(
                        children: const [
                          Text(
                            'Thank You',
                            style: AppTypography.heading2,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Your Order Is Complete',
                            style: AppTypography.heading3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Oops! Something\nWent Wrong',
                            style: AppTypography.heading2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'We are sorry your payment could\nnot be processed, Try again.',
                            style: AppTypography.heading3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 170,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            RouteAnimation.fadeRoute(const HomeScreen()));
                      },
                      title: 'Return Home',
                      textColor: AppColors.terracotta,
                      width: 161,
                    ),
                    AppButton(
                      onPressed: () {
                        Navigator.push(context,
                            RouteAnimation.fadeRoute(const TrackOrder()));
                      },
                      title: check ? 'Track Order' : 'Try Again',
                      textColor: AppColors.terracotta,
                      width: 161,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
