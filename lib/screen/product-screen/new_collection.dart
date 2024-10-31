import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({super.key});

  @override
  State<NewCollection> createState() => _NewCollectionState();
}

class _NewCollectionState extends State<NewCollection> {
  // int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Living Room',
    'Decorative Lights',
    'Beds',
    'Sofa',
    'Tables',
    'Chairs',
    'Cupboard',
    'Decor',
  ];

  // late Bed bed;
  List<Product> newCollections = [];

  List<Product> _getNewCollections() {
    newCollections = Product.getNewCollections();
    // for (int index = 0; index < desks.length; index++) {
    //   bedNames.add(desks[index].name);
    //   images.add(desks[index].image);
    //   price.add(desks[index].price);
    //   descriptions.add(desks[index].description);
    // }
    return newCollections;
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
          topSpace: 30,
          space: 30,
          products: _getNewCollections(),
          categories: _categories,
          title: 'New Collection',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
