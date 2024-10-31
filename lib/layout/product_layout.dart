import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screen/search/search_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/custom_card.dart';
import 'package:provider/provider.dart';

class ProductLayout extends StatelessWidget {
  final String title;
  final List<Product>? products;
  final List<String> categories;
  final Function(int) onCategorySelected; // Callback for category selection
  final Color? textColor;
  final double? space;
  final double? topSpace;

  const ProductLayout({
    super.key,
    required this.title,
    required this.categories,
    required this.onCategorySelected,
    this.textColor,
    this.space,
    this.products,
    this.topSpace,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: title,
        iconRight: [
          Padding(
            padding: EdgeInsets.only(
                right: 24 * MediaQuery.of(context).size.width / 393),
            child: GestureDetector(
                onTap: () => Navigator.push(
                    context, RouteAnimation.fadeRoute(const SearchScreen())),
                child: SvgPicture.asset(AppIcon.botSearch)),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigatorBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 24 / 852,
              right: screenWidth * 4 / 393,
              left: screenWidth * 4 / 393),
          child: Column(
            children: [
              SizedBox(
                height: 27.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            onCategorySelected(
                                index); // Notify when category is selected
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30 * screenWidth / 393),
                            child: Text(categories[index],
                                style: isDarkMode
                                    ? AppTypography.bodyText
                                    : AppTypography.bodyTextSalmon),
                          ),
                        ),
                        if (index < categories.length - 1)
                          const SizedBox(
                            height: 24, // Adjust the height as needed
                            child: VerticalDivider(
                              color: AppColors.salmon,
                              thickness: 1,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: topSpace ?? 25),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 22 * screenWidth / 393),
                child: SizedBox(
                  height: screenHeight * 0.7,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products!.length, // Use images length
                    itemBuilder: (context, index) {
                      return CustomCard(
                        space: space ?? 9,
                        cardWidth: 163,
                        imageHeight: 150,
                        imageWidth: 153,
                        product: products![index],
                        fontSize: 16,
                        textColor: textColor ?? AppColors.salmon,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
