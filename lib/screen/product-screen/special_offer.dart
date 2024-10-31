import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/layout/product_layout.dart';
import 'package:furniture_app/models/product.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({super.key});

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
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
  List<Product> offers = [];

  List<Product> _getOffers() {
    offers = Product.getOffers();
    // for (int index = 0; index < desks.length; index++) {
    //   bedNames.add(desks[index].name);
    //   images.add(desks[index].image);
    //   price.add(desks[index].price);
    //   descriptions.add(desks[index].description);
    // }
    return offers;
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
          space: 14,
          products: _getOffers(),
          categories: _categories,
          title: 'Special Offer',
          onCategorySelected: _onCategorySelected,
          textColor: AppColors.terracotta,
        ),
      ),
    );
  }
}
