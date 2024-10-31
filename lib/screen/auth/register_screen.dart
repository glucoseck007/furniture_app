import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/auth/login_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/input/date_input.dart';
import 'package:furniture_app/widget/input/default_input.dart';
import 'package:furniture_app/widget/input/email_input.dart';
import 'package:furniture_app/widget/input/password_input.dart';
import 'package:furniture_app/widget/input/phone_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        height: 65,
        title: 'login_screen.signup'.tr(),
        iconRight: const [],
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * (8 / 393),
            horizontal: screenWidth * (32 / 393),
          ),
          child: Column(
            children: [
              _buildInputField(context, _fullnameController,
                  'login_screen.fullName', false, false, false, false),
              _buildInputField(context, _usernameController,
                  'login_screen.username', true, false, false, false),
              _buildInputField(context, _phoneController,
                  'login_screen.phonenumber', false, false, true, false),
              _buildInputField(context, _dobController, 'login_screen.dob',
                  false, false, false, true),
              _buildInputField(context, _passwordController,
                  'login_screen.password', false, true, false, false),
              _buildInputField(context, _repasswordController,
                  'login_screen.confirmPass', false, true, false, false),
              SizedBox(height: screenHeight * 20 / 852),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing, you agree to \n',
                  style: isDarkMode
                      ? AppTypography.bodyText
                      : AppTypography.bodyTextDark,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Use',
                      style: isDarkMode
                          ? AppTypography.bodyText
                          : AppTypography.bodyTextDark,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: ' and ',
                      style: isDarkMode
                          ? AppTypography.bodyText
                          : AppTypography.bodyTextDark,
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: isDarkMode
                          ? AppTypography.bodyText
                          : AppTypography.bodyTextDark,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: '.',
                      style: isDarkMode
                          ? AppTypography.bodyText
                          : AppTypography.bodyTextDark,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 10 / 852),
              AppButton(
                title: 'Sign Up',
                onPressed: () {
                  Navigator.pushReplacement(
                      context, RouteAnimation.fadeRoute(const LoginScreen()));
                },
              ),
              SizedBox(height: screenHeight * 18 / 852),
              SizedBox(height: screenHeight * 8.12 / 852),
              Text(
                'login_screen.anotherWay'.tr(),
                style: isDarkMode
                    ? AppTypography.smallText
                    : AppTypography.smallTextDark,
              ),
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
                  Navigator.push(
                      context, RouteAnimation.fadeRoute(const LoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: screenWidth * 45 / 393),
                    Text(
                      'Already have an account? ',
                      style: isDarkMode
                          ? AppTypography.smallText
                          : AppTypography.smallTextDark,
                    ),
                    const Text('Log in',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: AppColors.salmon,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      BuildContext context,
      TextEditingController controller,
      String s,
      bool email,
      bool pass,
      bool phone,
      bool dob) {
    double screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * (23 / 852)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.tr(),
            style: isDarkMode
                ? AppTypography.bodyText
                : AppTypography.bodyTextDark,
          ),
          SizedBox(height: screenHeight * (8 / 852)),
          if (email)
            EmailInput(
              hintText: 'login_screen.exampleEmail'.tr(),
              controller: controller,
            )
          else if (pass)
            PasswordInput(
              controller: controller,
              requireSpecialChar: true,
              requireUppercase: true,
            )
          else if (phone)
            PhoneNumberInput(
              controller: controller,
              hintText: 'login_screen.examplePhone'.tr(),
            )
          else if (dob)
            DatePickerInput(
              firstDate: DateTime(1920),
              lastDate: DateTime(2025),
              controller: controller,
            )
          else
            DefaultInput(
              controller: controller,
            )
        ],
      ),
      // SizedBox(height: screenHeight * (8/852)),
    );
  }

  // PreferredSize newMethod(double screenHeight, double screenWidth) {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(screenHeight * (90 / 852)),
  //     child: Padding(
  //       padding: EdgeInsets.only(top: screenHeight * (34 / 852)),
  //       child: AppBar(
  //         centerTitle: true,
  //         backgroundColor: Colors.transparent,
  //         title: const Text(
  //           'Create Account',
  //           style:
  //               TextStyle(color: AppColors.salmon, fontWeight: AppFont.semiBold),
  //         ),
  //         leading: Padding(
  //           padding: EdgeInsets.only(left: screenWidth * (26 / 293)),
  //           child: SvgPicture.asset(AppIcon.leftArrow),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
