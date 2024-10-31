import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/auth/forgot_pass_screen.dart';
import 'package:furniture_app/screen/auth/register_screen.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/screen/launch_sreen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/input/email_input.dart';
import 'package:furniture_app/widget/input/password_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        iconRight: const [],
        onLeadingPressed: () {
          Navigator.pushReplacement(
              context, RouteAnimation.fadeRoute(const LaunchScreen())
          );
        },
        height: 65,
        title: 'login_screen.login'.tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * (15 / 393),
            horizontal: screenWidth * (32 / 393),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 70 / 852),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('login_screen.welcome'.tr(),
                            style: AppTypography.heading3),
                        SizedBox(height: 9 * screenHeight / 852),
                        Text('login_screen.info'.tr(),
                            style: AppTypography.smallTextDark),
                      ],
                    ),
                  ],
                ),
              ),
              ...List.generate(
                2,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * (23 / 852)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          index == 0
                              ? 'login_screen.username'.tr()
                              : 'login_screen.password'.tr(),
                          style: isDarkMode
                              ? AppTypography.bodyText
                              : AppTypography.bodyTextDark),
                      SizedBox(height: screenHeight * (8 / 852)),
                      index == 0
                          ? EmailInput(
                              hintText: 'login_screen.exampleEmail'.tr(),
                              controller: _usernameController,
                            )
                          : PasswordInput(
                              controller: _passwordController,
                              requireSpecialChar: true,
                              requireUppercase: true,
                            )
                    ],
                  ),
                  // SizedBox(height: screenHeight * (8 / 852)),
                ),
              ),
              SizedBox(height: screenHeight * 20 / 852),
              AppButton(
                  title: 'login_screen.login'.tr(),
                  // textColor:
                  //     isDarkMode ? AppColors.white : AppColors.terracotta,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen()));
                  }),
              SizedBox(height: screenHeight * 8 / 852),
              TextButton(
                onPressed: () {
                  // Define the action when the button is pressed, e.g., navigate to reset password screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ForgotPassScreen()));
                },
                child: Text(
                  'login_screen.forgotPass'.tr(),
                  style: isDarkMode
                      ? AppTypography.bodyText
                      : AppTypography.bodyTextDark,
                ),
              ),
              SizedBox(height: screenHeight * 120 / 852),
              Text('login_screen.anotherWay'.tr(),
                  style: isDarkMode
                      ? AppTypography.smallText
                      : AppTypography.smallTextDark),
              SizedBox(height: screenHeight * 19.88 / 852),
              Row(
                children: [
                  SizedBox(width: screenWidth * 122 / 393),
                  SvgPicture.asset(AppIcon.fbIcon),
                  SizedBox(width: screenWidth * 19.81 / 393),
                  SvgPicture.asset(AppIcon.ggIcon),
                ],
              ),
              SizedBox(height: screenHeight * 19.12 / 852),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      RouteAnimation.fadeRoute(const RegisterScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: screenWidth * 45 / 393),
                    Text(
                      '${'login_screen.dontHaveAcc'.tr()}\t',
                      style: TextStyle(
                          color: isDarkMode
                              ? AppColors.white
                              : AppColors.darkLetter),
                    ),
                    Text('login_screen.signup'.tr(),
                        style: const TextStyle(color: AppColors.salmon)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
