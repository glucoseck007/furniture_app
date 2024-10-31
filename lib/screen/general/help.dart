import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/general/chat_screen.dart';
import 'package:furniture_app/screen/general/faq.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Map<String, dynamic>> settings = [
    {'id': 1, 'label': 'Customer Service', 'icon': AppIcon.helpIcon},
    {'id': 2, 'label': 'Website', 'icon': AppIcon.globe},
    {'id': 3, 'label': 'Facebook', 'icon': AppIcon.fbIcon},
    {'id': 4, 'label': 'Whatsapp', 'icon': AppIcon.whatsapp},
    {'id': 5, 'label': 'Instagram', 'icon': AppIcon.igIcon},
  ];

  late String selectedChoice;

  @override
  void initState() {
    super.initState();
  }

  void onClickButtonEvent() {}

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        iconRight: const [],
        title: 'Help & FAQs',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              'How Can We Help You?',
              style: isDarkMode
                  ? AppTypography.bodyText
                  : AppTypography.bodyTextDark,
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: AppColors.salmon,
              indent: 15,
              endIndent: 15,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton(
                    onPressed: () {
                      Navigator.push(
                          context, RouteAnimation.fadeRoute(const FAQScreen()));
                    },
                    title: 'FAQ',
                    height: 25,
                    width: 158,
                    textColor:
                        isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                    backgroundColor:
                        isDarkMode ? AppColors.greyDark : AppColors.beige),
                AppButton(
                    onPressed: () {
                      setState(() {});
                    },
                    title: 'Contact Us',
                    height: 25,
                    width: 158,
                    textColor:
                        isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                    backgroundColor:
                        isDarkMode ? AppColors.greyDark : AppColors.beige)
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: settings.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedChoice = settings[index]['label'];
                        });
                        switch (selectedChoice) {
                          case 'Customer Service':
                            Navigator.push(context,
                                RouteAnimation.fadeRoute(const ChatScreen()));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Center vertically
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: AppColors.salmon,
                                    child: SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Transform.scale(
                                        scale: 0.5,
                                        child: SvgPicture.asset(
                                          settings[index]['icon'],
                                          // ignore: deprecated_member_use
                                          color: AppColors.greyDark,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 22),
                                Text(
                                  settings[index]['label'],
                                  style: isDarkMode
                                      ? AppTypography.bodyText
                                      : AppTypography
                                          .bodyTextDark, // Ensure different style for light mode
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              AppIcon.v,
                            ), // Right arrow icon
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
