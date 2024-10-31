import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
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
  List<Product> kitchens = [];
  List<String> images = [];
  List<String> bedNames = [];
  List<double> price = [];
  List<String> descriptions = [];

  List<Product> _getKitchens() {
    kitchens = Product.getKitchens();
    // for (int index = 0; index < kitchens.length; index++) {
    //   bedNames.add(kitchens[index].name);
    //   images.add(kitchens[index].image);
    //   price.add(kitchens[index].price);
    //   descriptions.add(kitchens[index].description);
    // }
    return kitchens;
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
          products: _getKitchens(),
          space: 22,
          categories: _categories,
          title: 'Kitchen',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
