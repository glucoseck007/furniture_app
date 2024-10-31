import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final int rating;
  final int views;

  const ReviewCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 150,
      width: 420,
      margin:
          const EdgeInsets.symmetric(vertical: 8.0), // Spacing between cards
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isDarkMode ? AppColors.white : AppColors.beige,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    imagePath,
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: AppTypography.bodyTextDark,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTypography.smallTextDark,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.star, size: 16, color: Colors.redAccent),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: AppTypography.smallTextDark,
                ),
                const SizedBox(width: 16),
                const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  views.toString(),
                  style: AppTypography.smallTextDark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
