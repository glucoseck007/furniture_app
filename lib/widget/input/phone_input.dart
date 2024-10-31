import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class PhoneNumberInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final int minLength;
  final Color? textColor;

  const PhoneNumberInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.width,
    this.minLength = 10,
    this.textColor, // Minimum length for phone number
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  bool firstInput = false;

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'login_screen.error1'.tr(); // Error: Field is required
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'login_screen.error2'.tr(); // Error: Must contain only digits
    } else if (value.length < widget.minLength) {
      return 'login_screen.error4'.tr(); // Error: Not enough digits
    }
    return null; // No error
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? 41,
          width: widget.width ?? 330,
          child: TextFormField(
            style: TextStyle(color: widget.textColor ?? AppColors.greyDark),
            controller: widget.controller,
            keyboardType: TextInputType.phone,
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
              prefixIcon: const Icon(Icons.phone),
            ),
            onChanged: (value) {
              setState(() {
                firstInput = true;
              });
            },
            validator: _validatePhoneNumber,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (firstInput)
          if (_validatePhoneNumber(widget.controller?.text) != null)
            Text(
              _validatePhoneNumber(widget.controller?.text) ?? '',
              style: TextStyle(color: Colors.red[600], fontSize: 12),
            ),
      ],
    );
  }
}
