import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class AppSlider extends StatefulWidget {
  final ValueChanged<double> onPriceChanged; // Callback to pass the price

  const AppSlider({
    super.key,
    required this.onPriceChanged, // Require the callback
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double _currentSliderValue = 500;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            'Price Range',
            style: AppTypography.bodyTextSalmon,
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 100,
          max: 1500,
          divisions: 100,
          activeColor: AppColors.salmon,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            widget.onPriceChanged(value); // Call the callback to pass value
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSliderValue = 100;
                  });
                  widget.onPriceChanged(100); // Pass fixed value
                },
                child: Text('\$100',
                    style: isDarkMode
                        ? AppTypography.bodyText
                        : AppTypography.bodyTextDark),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSliderValue = 500;
                  });
                  widget.onPriceChanged(500); // Pass fixed value
                },
                child: Text('\$500',
                    style: isDarkMode
                        ? AppTypography.bodyText
                        : AppTypography.bodyTextDark),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSliderValue = 1000;
                  });
                  widget.onPriceChanged(1000); // Pass fixed value
                },
                child: Text('\$1000',
                    style: isDarkMode
                        ? AppTypography.bodyText
                        : AppTypography.bodyTextDark),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentSliderValue = 1500;
                  });
                  widget.onPriceChanged(1500); // Pass fixed value
                },
                child: Text('\$1500',
                    style: isDarkMode
                        ? AppTypography.bodyText
                        : AppTypography.bodyTextDark),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
