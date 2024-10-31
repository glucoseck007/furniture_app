import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/wishlist/dream_board.dart';
import 'package:provider/provider.dart';

class HolderLayout extends StatelessWidget {
  final bool check;

  const HolderLayout({super.key, required this.check});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.push(
            context, RouteAnimation.fadeRoute(const HomeScreen())),
        height: 65,
        title: check ? 'My Cart' : 'Wishlist',
        iconRight: [
          check
              ? Padding(
                  padding: EdgeInsets.only(
                      right: 24 * MediaQuery.of(context).size.width / 393),
                  child: SvgPicture.asset(AppIcon.botEdit),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      right: 24 * MediaQuery.of(context).size.width / 393),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcon.botTrash),
                      const SizedBox(width: 2),
                      GestureDetector(
                          onTap: () => Navigator.push(context,
                              RouteAnimation.fadeRoute(const DreamBoard())),
                          child: SvgPicture.asset(AppIcon.botEdit)),
                      const SizedBox(width: 2),
                      SvgPicture.asset(AppIcon.onAdd),
                    ],
                  ),
                )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              check
                  ? SvgPicture.asset(AppIcon.cartHolder)
                  : SvgPicture.asset(AppIcon.wishlistHolder),
              SizedBox(height: 27.16 * MediaQuery.of(context).size.height / 852),
              check
                  ? Text(
                      'There Are No Items\nIn Your Cart',
                      style: isDarkMode
                          ? AppTypography.notiLight
                          : AppTypography.notiDark,
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'Your Wishlist Is Empty',
                      style: isDarkMode
                          ? AppTypography.notiLight
                          : AppTypography.notiDark,
                      textAlign: TextAlign.center,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
