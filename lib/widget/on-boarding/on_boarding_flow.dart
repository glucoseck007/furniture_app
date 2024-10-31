import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/screen/launch_sreen.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/on-boarding/on_boarding_layout.dart';

class OnBoardingFlow extends StatefulWidget {
  const OnBoardingFlow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingFlowState createState() => _OnBoardingFlowState();
}

class _OnBoardingFlowState extends State<OnBoardingFlow> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      'imagePath': AppImage.ob1,
      'title': 'Comfortable Space',
    },
    {
      'imagePath': AppImage.ob2,
      'title': 'Modern Design',
    },
    {
      'imagePath': AppImage.ob3,
      'title': 'Styled Living',
    },
    {
      'imagePath': AppImage.ob4,
      'title': 'Relaxing Furniture',
    },
  ];

  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _onboardingData.length,
          onPageChanged: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
              duration: const Duration(microseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: OnBoardingLayout(
                imagePath: _onboardingData[index]['imagePath']!,
                title: _onboardingData[index]['title']!,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    double a = 106;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * (29 / 852)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * (36 / 393)),
            child: Row(
              children: List.generate(
                  _onboardingData.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                          right: screenWidth * (7 / 393),
                        ),
                        child: AnimatedContainer(
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                          height: screenHeight * (7 / 852),
                          width: _currentPage == index
                              ? screenWidth * (36 / 393)
                              : screenWidth * (12 / 393),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: _currentPage == index
                                  ? AppColors.salmon
                                  : AppColors.beige),
                        ),
                      )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * (a / 393)),
            child:
                _currentPage >= 0 && _currentPage < _onboardingData.length - 1
                    ? AppButton(
                        title: 'Next',
                        width: screenWidth * (133 / 393),
                        height: screenHeight * (41 / 852),
                        textColor: AppColors.terracotta,
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        })
                    : AppButton(
                        title: 'Get started',
                        width: screenWidth * (133 / 393),
                        height: screenHeight * (41 / 852),
                        textColor: AppColors.terracotta,
                        onPressed: () {
                          Navigator.push(context,
                              RouteAnimation.fadeRoute(const LaunchScreen()));
                        },
                      ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
