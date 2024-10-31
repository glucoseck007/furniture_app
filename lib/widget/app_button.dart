import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? textColor;
  final String? icon;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? borderRadius;
  final TextStyle? textStyle;

  const AppButton(
      {super.key,
      this.title,
      this.textColor,
      this.backgroundColor,
      required this.onPressed,
      this.height,
      this.width,
      this.icon,
      this.fontSize,
      this.borderRadius,
      this.textStyle});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    // Define colors based on button state and dark mode
    Color? buttonBackgroundColor;
    Color buttonTextColor;

    if (isPressed) {
      buttonBackgroundColor =
          isDarkMode ? AppColors.orangeDark : AppColors.beige;
      buttonTextColor = isDarkMode ? AppColors.salmon : AppColors.brownRosy;
    } else if (isHovered) {
      buttonBackgroundColor =
          isDarkMode ? AppColors.orangeDark : AppColors.beige;
      buttonTextColor = isDarkMode ? AppColors.salmon : AppColors.brownRosy;
    } else {
      buttonBackgroundColor = isDarkMode
          ? widget.backgroundColor ?? AppColors.salmon
          : widget.backgroundColor ?? AppColors.salmon;
      buttonTextColor = widget.textColor ?? AppColors.terracotta;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        child: SizedBox(
            width: widget.width ?? 207,
            height: widget.height ?? 45,
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 30)),
                backgroundColor: buttonBackgroundColor,
                textStyle: widget.textStyle ??
                    TextStyle(
                        color: widget.textColor ?? buttonTextColor,
                        fontSize: widget.fontSize ?? 20),
              ),
              child: _buildButtonContent(buttonTextColor),
            )),
      ),
    );
  }

  Row _buildButtonContent(Color buttonTextColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Allows Row to wrap its content
      children: [
        if (widget.icon != null) ...[
          SvgPicture.asset(
            widget.icon!,
            height: 12, // Scale down the icon if the button is small
            width: 12,
          ),
          const SizedBox(width: 4), // Adjust space between icon and text
        ],
        Text(
          widget.title ?? '',
          style: widget.textStyle ??
              AppTypography.buttonText.copyWith(
                  color: widget.textColor ?? buttonTextColor,
                  fontSize: widget.fontSize),
          textAlign: TextAlign.center,
          softWrap: false, // Prevent text wrapping
          overflow: TextOverflow.ellipsis, // Avoid overflow with ellipses
        ),
      ],
    );
  }
}
