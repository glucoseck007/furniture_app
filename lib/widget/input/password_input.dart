import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final int minLength;
  final bool requireSpecialChar;
  final bool requireUppercase;
  final String? notice;

  const PasswordInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.width,
    this.minLength = 8,
    this.requireSpecialChar = true,
    this.requireUppercase = true,
    this.notice,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  bool firstInput = false;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'login_screen.error1'.tr();
    } else if (value.length < widget.minLength) {
      return 'login_screen.error4'.tr();
    } else if (widget.requireSpecialChar &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'login_screen.error3'.tr();
    } else if (widget.requireUppercase && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'login_screen.error5'.tr();
    }
    return null; // No error
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.notice != null)
          Text(
            widget.notice!,
            style: isDarkMode
                ? AppTypography.bodyText
                : AppTypography.bodyTextDark,
          ),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height ?? 41,
          width: widget.width ?? 330,
          child: TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTypography.hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.salmon),
                borderRadius: BorderRadius.circular(18),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: AppColors.beige,
              filled: true,
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  AppIcon.eye,
                  height: 20,
                  width: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            onChanged: (value) {
              setState(() {
                firstInput = true;
              }); // Trigger a rebuild to show validation error
            },
            validator: _validatePassword,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (firstInput)
          if (_validatePassword(widget.controller?.text) != null)
            Text(
              _validatePassword(widget.controller?.text) ?? '',
              style: TextStyle(color: Colors.red[600], fontSize: 12),
            ),
      ],
    );
  }
}
