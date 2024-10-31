import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onLeadingPressed;
  final String? title;
  final double height;
  final bool showLeft;
  final String? iconLeft;
  final Color? leftColor;
  final List<Widget>? iconRight;

  const CustomAppBar(
      {super.key,
      this.title,
      required this.height,
      this.iconLeft,
      this.showLeft = false,
      this.iconRight,
      this.onLeadingPressed,
      this.leftColor});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<CustomAppBar> createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          onPressed: widget.onLeadingPressed,
          icon: SvgPicture.asset(
            AppIcon.leftArrow,
            height: 20,
            width: 20,
            // ignore: deprecated_member_use
            color: widget.leftColor ??
                (isDarkMode ? AppColors.white : AppColors.greyDark),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      actions: widget.iconRight ??
          [
            Padding(
                padding: EdgeInsets.only(
                    right: 24 * MediaQuery.of(context).size.width / 393),
                child: SvgPicture.asset(AppIcon.botSearch)),
          ],
      title: Text(
        widget.title ?? '',
        style: AppTypography.heading3,
      ),
    );
  }
}
