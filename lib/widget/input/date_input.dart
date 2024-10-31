import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class DatePickerInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color? textColor;

  const DatePickerInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.height,
    this.width,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.textColor,
  });

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Format the selected date and display it in the input field
        widget.controller?.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 41,
      width: widget.width ?? 330,
      child: TextFormField(
        style: TextStyle(color: widget.textColor ?? AppColors.greyDark),
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'DD/MM/YYYY',
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
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ),
      ),
    );
  }
}
