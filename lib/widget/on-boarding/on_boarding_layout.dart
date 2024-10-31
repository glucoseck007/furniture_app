import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/launch_sreen.dart';
import 'package:provider/provider.dart';

class OnBoardingLayout extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  // final String buttonTitle;
  // final VoidCallback onButtonPressed;

  const OnBoardingLayout({
    super.key,
    required this.imagePath,
    required this.title,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    // required this.buttonTitle,
    // required this.onButtonPressed,
  });

  @override
  State<OnBoardingLayout> createState() => _OnBoardingLayoutState();
}

class _OnBoardingLayoutState extends State<OnBoardingLayout>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * (121 / 852),
                ),
                child: Container(
                  height: screenHeight * (378 / 852),
                  decoration: const BoxDecoration(
                    color: AppColors.beige,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -(screenHeight * (30 / 852)),
                child: SizedBox(
                  height: screenHeight * (501 / 852),
                  width: screenWidth,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * (23 / 852),
                right: screenWidth * (10 / 393),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LaunchScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the button takes up minimal space
                    mainAxisAlignment: MainAxisAlignment.end, // Align the icon to the end
                    children: [
                      const Text('Skip', style: AppTypography.smallTextDark),
                      const SizedBox(width: 8), // Space between the text and the icon
                      SvgPicture.asset(AppIcon.rightArrow),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight * (76 / 852)),
          Text(widget.title, style: AppTypography.heading2),
          SizedBox(height: screenHeight * (26 / 852)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (36 / 393),
            ),
            child: Text(
              widget.description,
              style: isDarkMode
                  ? AppTypography.smallText
                  : AppTypography.smallTextDark,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
