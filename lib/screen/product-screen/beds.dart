import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class BedsScreen extends StatefulWidget {
  const BedsScreen({super.key});

  @override
  State<BedsScreen> createState() => _BedsScreenState();
}

class _BedsScreenState extends State<BedsScreen> {
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
  List<Product> beds = [];
  List<String> images = [];
  List<String> bedNames = [];
  List<double> price = [];
  List<String> descriptions = [];

  List<Product> _getBeds() {
    beds = Product.getBeds();
    // for (int index = 0; index < desks.length; index++) {
    //   bedNames.add(desks[index].name);
    //   images.add(desks[index].image);
    //   price.add(desks[index].price);
    //   descriptions.add(desks[index].description);
    // }
    return beds;
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
          products: _getBeds(),
          categories: _categories,
          title: 'Beds',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
