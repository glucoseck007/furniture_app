import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/auth/forgot_pass_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/password_input.dart';
import 'package:provider/provider.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  List task = ['Current Password', 'New Password', 'Confirm New Password'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: 'Password Settings',
        iconRight: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              PasswordInput(
                                notice: task[index],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const ForgotPassScreen())),
                                child: const Text(
                                  'Forgot Password?',
                                  style: AppTypography.smallTextSalmon,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: PasswordInput(
                          notice: task[index],
                        ),
                      ),
                    );
                  }),
            ),
            AppButton(
              onPressed: () {},
              title: 'Change Password',
            )
          ],
        ),
      ),
    );
  }
}
