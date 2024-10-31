import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/constants/app_typography.dart';

class ExpiryDateInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? textColor;
  final double? height;
  final double? width;

  const ExpiryDateInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textColor,
    this.height,
    this.width,
  });

  @override
  State<ExpiryDateInput> createState() => _ExpiryDateInputState();
}

class _ExpiryDateInputState extends State<ExpiryDateInput> {
  String? _errorMessage;
  bool firstInput = false;

  // Check if the expiry date is valid
  bool _isExpiryDateValid(String date) {
    try {
      final DateFormat format = DateFormat('MM/yy');
      final DateTime expiryDate = format.parseStrict(date);
      final DateTime currentDate = DateTime.now();

      // Ensure the expiry date is in the future
      if (expiryDate.isBefore(DateTime(currentDate.year, currentDate.month))) {
        return false;
      }
      return true;
    } catch (e) {
      return false; // Return false if the format is incorrect
    }
  }

  // Handle text field submission and check validity
  void _validateExpiryDate(String value) {
    setState(() {
      if (_isExpiryDateValid(value)) {
        _errorMessage = null; // No error if the date is valid
      } else {
        _errorMessage = 'Invalid or expired date';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height ?? 41,
          width: widget.width ?? 330,
          child: TextField(
            controller: widget.controller,
            style: TextStyle(color: widget.textColor ?? Colors.black),
            keyboardType: TextInputType.datetime,
            onChanged:
                _validateExpiryDate, // Trigger validation on input change
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'MM/YY',
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
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (_errorMessage != null)
          Text(
            _errorMessage ?? '',
            style: TextStyle(color: Colors.red[600], fontSize: 12),
          ),
      ],
    );
  }
}
