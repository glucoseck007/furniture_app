import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
// import 'package:furniture_app/layout/holder_layout.dart';
import 'package:furniture_app/models/wishlist.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/wishlist/dream_board.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, this.boardTitle});

  final String? boardTitle;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

List<Wishlist> wishlist = Wishlist.wishlist;

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    // if (wishlist.isEmpty) return const HolderLayout(check: false);

    return Scaffold(
        appBar: CustomAppBar(
          onLeadingPressed: () => Navigator.push(
              context, RouteAnimation.fadeRoute(const HomeScreen())),
          height: 65,
          title: 'Wishlist',
          iconRight: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
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
        bottomNavigationBar: const BottomNavigatorBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'My Board',
                style: AppTypography.heading3,
              ),
              SizedBox(
                height: 10,
              ),
              _buildBoard()
            ],
          ),
        ));
  }
}

// ignore: camel_case_types
class _buildBoard extends StatelessWidget {
  const _buildBoard();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Row(
      children: [
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 110,
              height: 125,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.7),
                  color: AppColors.beige),
            ),
            Image.asset(
              AppImage.vintageCabinet,
              height: 136,
              width: 98,
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: SvgPicture.asset(
                AppIcon.favorites,
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 25,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Dream Room',
                style: AppTypography.bodyTextSalmon,
              ),
              Text(
                'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat vo',
                style: isDarkMode
                    ? AppTypography.smallText
                    : AppTypography.smallTextDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
