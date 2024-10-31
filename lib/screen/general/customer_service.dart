import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/screen/general/help.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:provider/provider.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
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
        child: Column(children: [
          Text(
            'Hello! I\'m Herer To Assist You?',
            style: isDarkMode
                ? AppTypography.bodyText
                : AppTypography.bodyTextDark,
          ),
          const SizedBox(height: 10),
          const dividerBar(),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.',
                style: isDarkMode
                    ? AppTypography.smallText
                    : AppTypography.smallTextDark),
          ),
          const SizedBox(height: 5),
          const dividerBar(),
          const SizedBox(height: 15),
          Tag(isDarkMode: isDarkMode, title: 'How can we help you?'),
          const SizedBox(height: 15),
          const dividerBar(),
          const SizedBox(height: 15),
          GestureDetector(
              onTap: () => Navigator.push(
                  context, RouteAnimation.fadeRoute(const HelpScreen())),
              child: Tag(isDarkMode: isDarkMode, title: 'Help center'))
        ]),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.isDarkMode,
    required this.title,
  });

  final bool isDarkMode;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isDarkMode
                ? AppTypography.bodyText
                : AppTypography.bodyTextDark,
          ),
          SvgPicture.asset(AppIcon.next)
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class dividerBar extends StatelessWidget {
  const dividerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.salmon,
      indent: 15,
      endIndent: 15,
    );
  }
}
