import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? label;
  final Color? borderColor;
  final double? width; // Custom width
  final double? height; // Custom height
  final double? labelFontSize; // Custom label font size
  final FontWeight? labelFontWeight; // Custom label font weight
  final IconButton? prefixIcon; // Icon at the start
  final IconButton? suffixIcon; // Icon at the end
  final bool? enabled;
  final ValueChanged<String>? onSubmitted;

  const InputField(
      {super.key,
      this.hint,
      this.label,
      this.borderColor,
      this.controller,
      this.width,
      this.height,
      this.labelFontSize,
      this.labelFontWeight,
      this.prefixIcon, // Accept prefix icon
      this.suffixIcon,
      this.enabled,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 41,
      width: width ?? MediaQuery.of(context).size.width * 330 / 393,
      child: TextField(
          enabled: enabled ?? true,
          controller: controller,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hint,
            label: Text(
              label ?? '',
              style: TextStyle(
                color: AppColors.darkLetter,
                fontSize: labelFontSize ?? 14,
                fontWeight: labelFontWeight ?? FontWeight.normal,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColors.beige,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColors.beige,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: borderColor == AppColors.salmon
                ? AppColors.white
                : borderColor ?? AppColors.beige,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding:
                        const EdgeInsets.only(right: 18), // Adjust margin here
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon, // Add suffix icon if provided
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.salmon),
                borderRadius: BorderRadius.circular(18)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          )),
    );
  }
}
