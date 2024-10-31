import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/toggle_button.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notiList = [
    'General Notification',
    'Sound',
    'Sound Call',
    'Vibrate',
    'Special Offers',
    'Payments',
    'Promo And Discount',
    'Cashback'
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        height: 65,
        title: 'Notification',
        iconRight: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView.builder(
          itemCount: notiList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          notiList[index],
                          style: isDarkMode
                              ? AppTypography.bodyText
                              : AppTypography.bodyTextDark,
                        ),
                      ],
                    ),
                    CustomToggleButton(
                      onChanged: (value) {},
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
