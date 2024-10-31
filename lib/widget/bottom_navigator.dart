import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/screen/cart/cart_detail.dart';
import 'package:furniture_app/screen/category/category.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/screen/profile/profile.dart';
import 'package:furniture_app/widget/wishlist/wishlist.dart';

class BottomNavigatorBar extends StatefulWidget {
  final bool? isDarkMode;

  const BottomNavigatorBar({super.key, this.isDarkMode});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, String>> icon = [
      {'lightImage': AppIcon.homeDefault},
      {'lightImage': AppIcon.categoriesDefault},
      {'lightImage': AppIcon.cartDefault},
      {'lightImage': AppIcon.wishlistDefault},
      {'lightImage': AppIcon.profileDefault},
    ];

    return SizedBox(
      height: 71 * screenHeight / 852,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(right: 28, left: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index; // Update selectedIndex
                });
                print(icon[index]['lightImage']);
                switch (icon[index]['lightImage']!) {
                  case AppIcon.homeDefault:
                    Navigator.pushReplacement(
                        context, RouteAnimation.fadeRoute(const HomeScreen()));
                    break;
                  case AppIcon.cartDefault:
                    Navigator.push(
                        context, RouteAnimation.fadeRoute(const CartDetail()));
                    break;
                  case AppIcon.wishlistDefault:
                    Navigator.push(context,
                        RouteAnimation.fadeRoute(const WishListScreen()));
                    break;
                  case AppIcon.categoriesDefault:
                    Navigator.push(context,
                        RouteAnimation.fadeRoute(const CategoryScreen()));
                    break;
                  case AppIcon.profileDefault:
                    Navigator.push(context,
                        RouteAnimation.fadeRoute(const ProfileScreen()));
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon[index]['lightImage']!,
                    // Update the icon color based on whether it is selected
                    // ignore: deprecated_member_use
                    color: widget.isDarkMode ?? false
                        ? selectedIndex == index
                            ? AppColors.salmon
                            : AppColors.beige
                        : selectedIndex == index
                            ? AppColors.greyDark
                            : AppColors.salmon,
                  ),
                  const SizedBox(height: 4), // Add some space
                  // Conditionally display the underline if the icon is selected
                  selectedIndex == index
                      ? Container(
                          height: 2,
                          width: 30,
                          color: widget.isDarkMode ?? false
                              ? AppColors.salmon
                              : AppColors.greyDark,
                        )
                      : const SizedBox(height: 2), // Space when not selected
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
