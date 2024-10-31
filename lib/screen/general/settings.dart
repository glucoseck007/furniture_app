import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/toggle_button.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Map<String, dynamic>> settings = [
    {
      'id': 1,
      'label': 'Notification Settings',
      'icon': AppIcon.notificationIcon
    },
    {'id': 2, 'label': 'Password Settings', 'icon': AppIcon.privacyIcon},
    {'id': 3, 'label': 'Delete Account', 'icon': AppIcon.profileDefault},
    {'id': 4, 'label': 'Dark Mode', 'icon': AppIcon.moon},
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
        appBar: CustomAppBar(
          onLeadingPressed: () => Navigator.pop(context),
          height: 65,
          title: 'Settings',
          iconRight: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                        if (settings[index]['id'] != 4)
                          SvgPicture.asset(
                            AppIcon.v,
                          )
                        else
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: CustomToggleButton(
                                initialValue: isDarkMode,
                                onChanged: (value) {
                                  setState(() {
                                    themeProvider.toggleTheme(value);
                                  });
                                }),
                          )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
