import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class SofaScreen extends StatefulWidget {
  const SofaScreen({super.key});

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
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
  List<Product> sofas = [];
  List<String> images = [];
  List<String> bedNames = [];
  List<double> price = [];
  List<String> descriptions = [];

  List<Product> _getSofas() {
    sofas = Product.getSofas();
    // for (int index = 0; index < sofas.length; index++) {
    //   bedNames.add(sofas[index].name);
    //   images.add(sofas[index].image);
    //   price.add(sofas[index].price);
    //   descriptions.add(sofas[index].description);
    // }
    return sofas;
  }

  void _onCategorySelected(int index) {
    setState(() {
      // Handle category selection logic if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    // _getSofas();
    return Scaffold(
      body: SafeArea(
        child: ProductLayout(
          categories: _categories,
          title: 'Sofa',
          products: _getSofas(),
          // images: images,
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
          // productNames: bedNames,
          // description: descriptions,
          // price: price,
        ),
      ),
    );
  }
}
