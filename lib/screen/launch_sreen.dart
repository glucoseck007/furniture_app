import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/auth/login_screen.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var isDarkMode = themeProvider.isDarkMode;

    // ignore: deprecated_member_use
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, right: 50, left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcon.launchIcon,
                // ignore: deprecated_member_use
                color: AppColors.salmon,
              ),
              SizedBox(
                height: 100,
                child: Stack(
                  children: const [
                    Text(
                      'HOME',
                      style: TextStyle(
                          fontSize: 58,
                          color: AppColors.salmon,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    Positioned(
                      top: 58,
                      child: Text(
                        'DECOR',
                        style: TextStyle(
                            color: AppColors.salmon,
                            fontWeight: FontWeight.w400,
                            fontSize: 34,
                            fontFamily: 'Poppins',
                            letterSpacing: 12.546),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 14.5,
                    color: isDarkMode ? AppColors.white : AppColors.darkLetter),
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                title: 'Log In',
              ),
              const SizedBox(
                height: 7,
              ),
              AppButton(
                onPressed: () {},
                title: 'Sign Up',
                textColor: isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                backgroundColor:
                    isDarkMode ? AppColors.greyDark : AppColors.beige,
              ),
              // Switch(
              //   value: themeProvider.isDarkMode,
              //   onChanged: (value) {
              //     themeProvider.toggleTheme(value); // Toggle dark mode
              //   },
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
