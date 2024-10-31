import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

class _DeskScreenState extends State<DeskScreen> {
  // int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Decorative Lights',
    'Beds',
    'Sofa',
    'Tables',
    'Chairs',
    'Cupboard',
    'Decor',
  ];

  // late Bed bed;
  List<Product> desks = [];
  List<String> images = [];
  List<String> bedNames = [];
  List<double> price = [];
  List<String> descriptions = [];

  List<Product> _getDesks() {
    desks = Product.getDesks();
    // for (int index = 0; index < desks.length; index++) {
    //   bedNames.add(desks[index].name);
    //   images.add(desks[index].image);
    //   price.add(desks[index].price);
    //   descriptions.add(desks[index].description);
    // }
    return desks;
  }

  void _onCategorySelected(int index) {
    setState(() {
      // Handle category selection logic if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductLayout(
          products: _getDesks(),
          categories: _categories,
          title: 'Desk',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
