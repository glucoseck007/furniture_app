import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class DiningScreen extends StatefulWidget {
  const DiningScreen({super.key});

  @override
  State<DiningScreen> createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen> {
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
  List<Product> dining = [];
  List<String> images = [];
  List<String> bedNames = [];
  List<double> price = [];
  List<String> descriptions = [];

  List<Product> _getDining() {
    dining = Product.getDining();
    // for (int index = 0; index < beds.length; index++) {
    //   bedNames.add(beds[index].name);
    //   images.add(beds[index].image);
    //   price.add(beds[index].price);
    //   descriptions.add(beds[index].description);
    // }
    return dining;
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
          products: _getDining(),
          categories: _categories,
          title: 'Dining Table',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
