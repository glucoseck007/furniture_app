import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/layout/detail_layout.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:provider/provider.dart';

class FilteredProductsScreen extends StatefulWidget {
  final List<Product>? filteredProducts;
  final String? selectedProduct;
  final String? selectedCategory;
  final Color? selectedColor;
  final double? selectedPrice; // Added price filter
  final String? keyword;

  const FilteredProductsScreen(
      {super.key,
      this.filteredProducts,
      this.selectedProduct,
      this.selectedCategory,
      this.selectedColor,
      this.selectedPrice,
      this.keyword});

  @override
  State<FilteredProductsScreen> createState() => _FilteredProductsScreenState();
}

class _FilteredProductsScreenState extends State<FilteredProductsScreen> {
  List<Product> allProducts = [];

  @override
  void initState() {
    super.initState();
    _loadAllProducts();
    _applyFilters();
  }

  void _loadAllProducts() {
    // Load all products from the model or data source
    allProducts = [
      ...Product.getBeds(),
      ...Product.getSofas(),
      ...Product.getDining(),
      ...Product.getKitchens(),
    ];
  }

  void _applyFilters() {
    List<Product> filteredProducts = allProducts;

    // Filter by product type if selected
    if (widget.selectedProduct != null && widget.selectedProduct != 'Default') {
      filteredProducts = filteredProducts
          .where((product) => product.type == widget.selectedProduct)
          .toList();
    }

    // Filter by category if selected
    if (widget.selectedCategory != null &&
        widget.selectedCategory != 'Default') {
      filteredProducts = filteredProducts
          .where((product) => product.category == widget.selectedCategory)
          .toList();
    }

    // Filter by color if selected
    if (widget.selectedColor != null &&
        widget.selectedColor != Colors.transparent) {
      filteredProducts = filteredProducts
          .where((product) => product.color == widget.selectedColor)
          .toList();
    }

    // Filter by price range if selected
    if (widget.selectedPrice != null) {
      filteredProducts = filteredProducts
          .where((product) => product.price <= widget.selectedPrice!)
          .toList();
    }

    if (widget.keyword != null && widget.keyword!.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) => product.name
              .toLowerCase()
              .contains(widget.keyword!.toLowerCase()))
          .toList();
    }

    setState(() {
      allProducts = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        height: 65,
        title: 'Results',
        iconRight: const [],
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          final item = allProducts[index];
          return Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              color: AppColors.beige,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Image.asset(
                            item.image,
                            height: 89,
                            width: 89,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: isDarkMode
                              ? AppTypography.bodyText
                              : AppTypography.bodyTextDark,
                        ),
                        Text(
                          '\$${item.price}',
                          style: isDarkMode
                              ? AppTypography.bodyText
                              : AppTypography.bodyTextDark,
                        ),
                      ],
                    ),
                  ],
                ),
                AppButton(
                  onPressed: () {
                    Navigator.push(context,
                        RouteAnimation.fadeRoute(DetailLayout(product: item)));
                  },
                  title: 'Details',
                  height: 25,
                  width: 111,
                  textColor:
                      isDarkMode ? AppColors.salmon : AppColors.terracotta,
                  backgroundColor:
                      isDarkMode ? AppColors.darkLetter : AppColors.salmon,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
