
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screen/product-screen/beds.dart';
import 'package:furniture_app/screen/product-screen/sofa.dart';
import 'package:furniture_app/screen/search/filter_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/app_slider.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/input_field.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedProductIndex = 8;
  int selectedCategoryIndex = 5;
  int selectedColorIndex = 6;
  double? selectedPrice;
  TextEditingController searchController = TextEditingController();

  List<Product> filteredProducts = [];

  void setSelectedProductIndex(int index) {
    print(index);
    setState(() {
      selectedProductIndex = index;
    });
  }

  // Method to set selected category index
  void setSelectedCategoryIndex(int index) {
    print(index);
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  // Method to set selected color index
  void setSelectedColorIndex(int index) {
    print(index);
    setState(() {
      selectedColorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final List<String> labels = [
      'Bed',
      'Lamp',
      'Plastic Plants',
      'Carpet',
      'Sofa',
      'Blue Chair',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
        height: 65,
        iconRight: const [],
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: const BottomNavigatorBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26 * screenWidth / 393),
          child: SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                InputField(
                  controller: searchController,
                  width: 342 * screenWidth / 393,
                  label: 'Search',
                  borderColor: AppColors.salmon,
                  suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        RouteAnimation.fadeRoute(FilteredProductsScreen(
                          keyword: searchController
                              .text, // Pass the keyword entered by user
                        )),
                      );
                                        },
                    icon: SvgPicture.asset(AppIcon.filter),
                  ),
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        RouteAnimation.fadeRoute(FilteredProductsScreen(
                          keyword: value,
                        )));
                  },
                ),
                SizedBox(height: screenHeight * 45.45 / 852),
                Row(
                  children: [
                    SizedBox(width: 10 * screenWidth / 393),
                    const Text('Top Searches', style: AppTypography.heading3),
                  ],
                ),
                SizedBox(height: 21 * screenHeight / 852),
                ...List.generate(
                  labels.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: 20 * screenHeight / 852,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(context,
                              RouteAnimation.fadeRoute(const BedsScreen()));
                        }
                        if (index == 4) {
                          Navigator.push(context,
                              RouteAnimation.fadeRoute(const SofaScreen()));
                        }
                      },
                      child: InputField(
                        enabled: false,
                        width: 342 * screenWidth / 393,
                        height: 50 * screenHeight / 852,
                        label: labels[index],
                        borderColor: isDarkMode ? null : AppColors.salmon,
                        labelFontSize: 15 * screenWidth / 393,
                        labelFontWeight: FontWeight.w500,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcon.botSearch),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    final List<String> products = [
      'Sofa',
      'Table',
      'Cupboards',
      'Office Chairs',
      'Desktop Lamp',
      'Puff Chair',
      'Decor',
      'Nightstand',
      'Default'
    ];
    final List<String> categories = [
      'Bedroom',
      'Living Room',
      'Kitchen',
      'Office',
      'Dining Room',
      'Default'
    ];
    List<Color> colors = [
      AppColors.filter1,
      AppColors.filter2,
      AppColors.filter3,
      AppColors.filter4,
      AppColors.filter5,
      AppColors.filter6,
      Colors.transparent
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow full control over height
      builder: (BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        final isDarkMode = themeProvider.isDarkMode;

        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                const Text(
                  'Filter',
                  style: AppTypography.heading3,
                ),
                const SizedBox(height: 25),
                AppSlider(
                  onPriceChanged: (value) => selectedPrice = value,
                ),
                ProductsFilter(
                  isDarkMode: isDarkMode,
                  products: products,
                  onProductSelected: setSelectedProductIndex,
                ),
                CategoriesFilter(
                    isDarkMode: isDarkMode,
                    categories: categories,
                    onCategorySelected: setSelectedCategoryIndex),
                ColorFilter(
                  isDarkMode: isDarkMode,
                  onColorSelected: setSelectedColorIndex,
                ),
                const SizedBox(height: 25),
                AppButton(
                  onPressed: () {
                    String selectedProduct = products[selectedProductIndex];
                    String selectedCategory =
                        categories[selectedCategoryIndex];
                    Color selectedColor = colors[selectedColorIndex];

                    // String selectedProduct =
                    //     (selectedProductIndex < products.length)
                    //         ? products[selectedProductIndex]
                    //         : 'Default';

                    // String selectedCategory =
                    //     (selectedCategoryIndex < categories.length)
                    //         ? categories[selectedCategoryIndex]
                    //         : 'Default';

                    // Color selectedColor = (selectedColorIndex < colors.length)
                    //     ? colors[selectedColorIndex]
                    //     : Colors.transparent;

                    print(colors[6]);

                    Navigator.push(
                        context,
                        RouteAnimation.fadeRoute(FilteredProductsScreen(
                            selectedProduct: selectedProduct,
                            selectedCategory: selectedCategory,
                            selectedColor: selectedColor,
                            selectedPrice: selectedPrice)));
                  },
                  title: 'Apply',
                  textColor:
                      isDarkMode ? AppColors.salmon : AppColors.terracotta,
                  // backgroundColor:
                  //     isDarkMode ? AppColors.salmon : AppColors.greyDark,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductsFilter extends StatefulWidget {
  const ProductsFilter({
    super.key,
    required this.isDarkMode,
    required this.products,
    required this.onProductSelected,
  });

  final bool isDarkMode;
  final List<String> products;
  final Function(int) onProductSelected;

  @override
  State<ProductsFilter> createState() => _ProductsFilterState();
}

class _ProductsFilterState extends State<ProductsFilter> {
  int? selectedIndex;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Products', style: AppTypography.bodyTextSalmon),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(4, (index) {
                return AppButton(
                  height: 26,
                  width: 90,
                  backgroundColor: selectedIndex == index
                      ? AppColors.salmon
                      : widget.isDarkMode
                          ? AppColors.darkLetter
                          : AppColors.beige,
                  textStyle: selectedIndex == index
                      ? AppTypography.smallTextTerracotta
                      : widget.isDarkMode
                          ? AppTypography.smallText
                          : AppTypography.smallTextBrownRosy,
                  title: widget.products[index],
                  onPressed: () {
                    setState(() {
                      if (!isClicked) {
                        isClicked = true;
                        selectedIndex = index;
                        widget.onProductSelected(index);
                      } else {
                        selectedIndex = 8;
                        print(selectedIndex);
                        widget.onProductSelected(selectedIndex!);
                        isClicked = false;
                      }
                    });
                  },
                );
              }),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(4, (index) {
                int customIndex = index + 4;
                return AppButton(
                  height: 26,
                  width: 90,
                  backgroundColor: selectedIndex == customIndex
                      ? AppColors.salmon
                      : widget.isDarkMode
                          ? AppColors.darkLetter
                          : AppColors.beige,
                  textStyle: selectedIndex == customIndex
                      ? AppTypography.smallTextTerracotta
                      : widget.isDarkMode
                          ? AppTypography.smallText
                          : AppTypography.smallTextBrownRosy,
                  title: widget.products[customIndex],
                  onPressed: () {
                    setState(() {
                      if (!isClicked) {
                        isClicked = true;
                        selectedIndex = customIndex;
                        widget.onProductSelected(customIndex);
                      } else {
                        selectedIndex = 8;
                        widget.onProductSelected(selectedIndex!);
                        // print(selectedIndex);
                        isClicked = false;
                      }
                    });
                  },
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({
    super.key,
    required this.isDarkMode,
    required this.categories,
    required this.onCategorySelected,
  });

  final bool isDarkMode;
  final List<String> categories;
  final Function(int) onCategorySelected;

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  int? selectedIndex;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories', style: AppTypography.bodyTextSalmon),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(3, (index) {
                return AppButton(
                  height: 26,
                  width: 111,
                  backgroundColor: selectedIndex == index
                      ? AppColors.salmon
                      : widget.isDarkMode
                          ? AppColors.darkLetter
                          : AppColors.beige,
                  textStyle: selectedIndex == index
                      ? AppTypography.smallTextTerracotta
                      : widget.isDarkMode
                          ? AppTypography.smallText
                          : AppTypography.smallTextBrownRosy,
                  title: widget.categories[index],
                  onPressed: () {
                    setState(() {
                      if (!isClicked) {
                        selectedIndex = index;
                        isClicked = true;
                        print(selectedIndex);
                        widget.onCategorySelected(index);
                      } else {
                        isClicked = false;
                        selectedIndex = 5;
                        widget.onCategorySelected(selectedIndex!);
                      }
                    });
                  },
                );
              }),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(2, (index) {
                int customIndex = index + 3;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AppButton(
                    height: 26,
                    width: 111,
                    backgroundColor: selectedIndex == customIndex
                        ? AppColors.salmon
                        : widget.isDarkMode
                            ? AppColors.darkLetter
                            : AppColors.beige,
                    textStyle: selectedIndex == customIndex
                        ? AppTypography.smallTextTerracotta
                        : widget.isDarkMode
                            ? AppTypography.smallText
                            : AppTypography.smallTextBrownRosy,
                    title: widget.categories[customIndex],
                    onPressed: () {
                      setState(() {
                        if (!isClicked) {
                          selectedIndex = customIndex;
                          isClicked = true;
                          widget.onCategorySelected(customIndex);
                        } else {
                          isClicked = false;
                          selectedIndex = 5;
                          widget.onCategorySelected(selectedIndex!);
                        }
                      });
                    },
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorFilter extends StatefulWidget {
  const ColorFilter({
    super.key,
    required this.isDarkMode,
    required this.onColorSelected,
  });

  final bool isDarkMode;
  final Function(int) onColorSelected;

  @override
  State<ColorFilter> createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
  int? selectedIndex; // Move selectedIndex here
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      AppColors.filter1,
      AppColors.filter2,
      AppColors.filter3,
      AppColors.filter4,
      AppColors.filter5,
      AppColors.filter6,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Colors', style: AppTypography.bodyTextSalmon),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(colors.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isClicked) {
                      selectedIndex = index; // Update the selected index
                      isClicked = true;
                      widget.onColorSelected(index);
                    } else {
                      selectedIndex = 6;
                      print(selectedIndex);
                      isClicked = false;
                      widget.onColorSelected(selectedIndex!);
                    }
                  });
                },
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[index],
                    border: Border.all(
                      color: selectedIndex == index
                          ? Colors
                              .black // Change this to your desired border color
                          : Colors.transparent, // No border if not selected
                      width: 2,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
