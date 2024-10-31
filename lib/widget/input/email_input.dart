import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class EmailInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  const EmailInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.width,
    this.backgroundColor,
  });

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool firstInput = false;

  String? _validateEmail(String? value) {
    // Define the regex pattern for email validation
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return 'login_screen.error4'.tr();
    } else if (!emailRegex.hasMatch(value)) {
      return 'login_screen.invalidEmail'.tr();
    } else {
      return null; // No error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 41,
          width: widget.width ?? 330,
          child: TextFormField(
            controller: widget.controller,
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
              fillColor: widget.backgroundColor ?? AppColors.beige,
              filled: true,
            ),
            onChanged: (value) {
              setState(() {
                firstInput = true;
              }); // Trigger a rebuild to show validation error
            },
            validator: _validateEmail,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (firstInput)
          if (_validateEmail(widget.controller?.text) != null)
            Text(
              _validateEmail(widget.controller?.text) ?? '',
              style: TextStyle(color: Colors.red[600], fontSize: 12),
            ),
      ],
    );
  }
}
