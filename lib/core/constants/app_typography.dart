import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class AppTypography {
  // Heading 1 - Tiêu đề lớn
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Poppins', // Font tùy chỉnh
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.terracotta, // Màu chữ tùy chỉnh
  );

  // Heading 2 - Tiêu đề trung bình
  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.salmon,
  );

  // Heading 3 - Tiêu đề nhỏ
  static const TextStyle heading3 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.salmon,
  );

  static const TextStyle notiLight = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.beige,
  );

  static const TextStyle notiDark = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkLetter,
  );

  // Body Text - Văn bản bình thường
  static const TextStyle bodyText = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static const TextStyle bodyTextDark = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkLetter,
  );

  static const TextStyle bodyTextSalmon = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.salmon,
  );

  // Small Text - Văn bản nhỏ
  static const TextStyle smallText = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  ); // Small Text - Văn bản nhỏ

  static const TextStyle smallTextSalmon = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.salmon,
  );

  static const TextStyle smallTextTerracotta = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.terracotta,
  );

  static const TextStyle smallTextBrownRosy = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.brownRosy,
  );

  static const TextStyle smallTextDark = TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.darkLetter,
  );

  // Button Text - Phông chữ cho các nút
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.terracotta,
  );

  static const TextStyle buttonText2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.beige,
  );

  //Hint Text
  static const TextStyle hintText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.brownRosy,
  );

  // Custom card
  static const TextStyle cardTextTitle = TextStyle(
    fontFamily: 'League Spartan',
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle descriptionTitle = TextStyle(
    fontFamily: 'League Spartan',
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );

  static const TextStyle priceTitle = TextStyle(
    color: AppColors.salmon,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle categoryTitle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w300,
    fontSize: 26,
    fontFamily: 'League Spartan',
  );
}
