import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class BestSeller extends StatefulWidget {
  const BestSeller({super.key});

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
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
  List<Product> best = [];

  List<Product> _getBestSeller() {
    best = Product.getBestSeller();
    // for (int index = 0; index < desks.length; index++) {
    //   bedNames.add(desks[index].name);
    //   images.add(desks[index].image);
    //   price.add(desks[index].price);
    //   descriptions.add(desks[index].description);
    // }
    return best;
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
          space: 20,
          products: _getBestSeller(),
          categories: _categories,
          title: 'Best Seller',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
