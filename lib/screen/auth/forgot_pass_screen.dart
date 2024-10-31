import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/input/email_input.dart';
import 'package:provider/provider.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        height: 65,
        title: 'Forgot Password',
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            // "Reset Password?" Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Text('login_screen.resetPass'.tr(),
                  style: AppTypography.heading3),
            ),
            SizedBox(height: screenHeight * 0.01),
            // Description Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontSize: 14,
                  color: isDarkMode
                      ? AppColors.white
                      : Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            // Rounded container below the AppBar
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  // height: screenHeight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors
                        .beige, // Background color of the rounded container
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.06),
                      // Email input field label
                      Text(
                        'login_screen.username'.tr(),
                        style: AppTypography.bodyTextDark,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      // Email TextFormField
                      EmailInput(
                        controller: _emailTextController,
                        backgroundColor: AppColors.white,
                        hintText: 'login_screen.exampleEmail'.tr(),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      // Send button
                      Center(
                        child: SizedBox(
                            width: screenWidth * 0.5,
                            height: 48,
                            child: AppButton(
                              onPressed: () {},
                              title: 'login_screen.send'.tr(),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
