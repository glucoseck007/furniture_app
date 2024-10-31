import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class DefaultInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Color? textColor;
  final double? height;
  final double? width;
  final String? icon;
  final bool? leftIcon;
  final bool? rightIcon;

  const DefaultInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.width,
    this.icon,
    this.leftIcon = false,
    this.rightIcon = false,
    this.textColor,
  });

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    Widget inputField = TextField(
      controller: widget.controller,
      style: TextStyle(color: widget.textColor ?? Colors.black),
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: AppTypography.hintText,
          // border: OutlineInputBorder(
          //     borderSide: const BorderSide(color: AppColors.salmon),
          //     borderRadius: BorderRadius.circular(18)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.salmon),
              borderRadius: BorderRadius.circular(18)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          fillColor: AppColors.beige,
          filled: true),
    );

    if (widget.icon != null) {
      inputField = Row(
        children: [
          if (widget.leftIcon ?? false) ...[
            SvgPicture.asset(
              widget.icon!,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8), // Space between icon and input field
          ],
          Expanded(child: inputField),
          if (widget.rightIcon ?? false) ...[
            const SizedBox(width: 8), // Space between input field and icon
            SvgPicture.asset(
              widget.icon!,
              height: 24,
              width: 24,
            ),
          ],
        ],
      );
    }

    return SizedBox(
      height: widget.height ?? 41,
      width: widget.width ?? 330,
      child: inputField,
    );
  }
}
