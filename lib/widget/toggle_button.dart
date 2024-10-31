import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton(
      {super.key, required this.onChanged, this.initialValue});

  final bool? initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isToggled = false;

  @override
  void initState() {
    super.initState();
    isToggled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: widget.initialValue ?? isToggled,
        onChanged: (value) {
          setState(() {
            isToggled = value;
          });
          widget.onChanged(value);
        },
        activeColor: AppColors.white,
        activeTrackColor: AppColors.salmon,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.salmon.withOpacity(0.4),
        // trackOutlineColor: AppColors.salmon,
        splashRadius: 0.0,
      ),
    );
  }
}
