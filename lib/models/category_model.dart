import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;
  Color iconColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.iconColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Living Room',
        iconPath: '${AppIcon.basePath}livingRoom.svg',
        boxColor: AppColors.beige,
        iconColor: AppColors.brownRosy));

    categories.add(CategoryModel(
        name: 'Bed Room',
        iconPath: '${AppIcon.basePath}bedRoom.svg',
        boxColor: AppColors.beige,
        iconColor: AppColors.brownRosy));

    categories.add(CategoryModel(
        name: 'Dining Room',
        iconPath: '${AppIcon.basePath}diningRoom.svg',
        boxColor: AppColors.beige,
        iconColor: AppColors.brownRosy));

    categories.add(CategoryModel(
        name: 'Kitchen',
        iconPath: '${AppIcon.basePath}kitchen.svg',
        boxColor: AppColors.beige,
        iconColor: AppColors.brownRosy));

    categories.add(CategoryModel(
        name: 'Office',
        iconPath: '${AppIcon.basePath}/office.svg',
        boxColor: AppColors.beige,
        iconColor: AppColors.brownRosy));

    return categories;
  }
}
