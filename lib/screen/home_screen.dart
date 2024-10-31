import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/layout/category_layout_1.dart';
import 'package:furniture_app/layout/category_layout_2.dart';
import 'package:furniture_app/models/cart.dart';
import 'package:furniture_app/models/category_model.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screen/cart/cart_detail.dart';
import 'package:furniture_app/screen/product-screen/best_seller.dart';
import 'package:furniture_app/screen/product-screen/new_collection.dart';
import 'package:furniture_app/screen/product-screen/special_offer.dart';
import 'package:furniture_app/screen/search/search_screen.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/custom_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CategoryModel> categories;
  late List<Product> newCollections;
  late List<Product> bestSeller;
  // bool isHovered = false;
  int? clickedIndex;

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getNewCollections();
    _getBestSeller();
  }

  void _getCategories() {
    setState(() {
      categories = CategoryModel.getCategories(); // Fetch categories
    });
  }

  void _getNewCollections() {
    setState(() {
      newCollections = Product.getNewCollections();
    });
  }

  void _getBestSeller() {
    setState(() {
      bestSeller = Product.getBestSeller();
    });
  }

  num get screenWidth => MediaQuery.of(context).size.width;
  num get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: BottomNavigatorBar(
        isDarkMode: isDarkMode,
      ),
      appBar: AppBar(
        toolbarHeight: screenHeight * 85 / 852,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(
              left: 8 * screenWidth / 393, top: 12 * screenHeight / 852),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi, Welcome Back',
                style: AppTypography.heading3,
              ),
              Text(
                'Create spaces that bring joy',
                style: AppTypography.smallText,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: 12 * screenHeight / 852, right: 22 * screenWidth / 393),
            child: IconButton(
                icon: SvgPicture.asset(AppIcon.botSearch),
                onPressed: () => Navigator.push(
                    context, RouteAnimation.fadeRoute(const SearchScreen()))),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: screenWidth as double,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22 * screenWidth / 393),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        RouteAnimation.fadeRoute(const SpecialOffer())),
                    child: Image.asset(
                      AppImage.special,
                      height: 132 * screenHeight / 852,
                      width: 349 * screenWidth / 393,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20 * screenHeight / 852),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4 * screenHeight / 852,
                        width: 20 * screenHeight / 852,
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppColors.salmon
                                : AppColors.darkLetter,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(width: 4 * screenWidth / 393),
                      Container(
                        height: 4 * screenHeight / 852,
                        width: 20 * screenHeight / 852,
                        decoration: BoxDecoration(
                            color:
                                isDarkMode ? AppColors.beige : AppColors.salmon,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(width: 4 * screenWidth / 393),
                      Container(
                        height: 4 * screenHeight / 852,
                        width: 20 * screenHeight / 852,
                        decoration: BoxDecoration(
                            color:
                                isDarkMode ? AppColors.beige : AppColors.salmon,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20 * screenHeight / 852),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Categories', style: AppTypography.heading3),
                    ],
                  ),
                  SizedBox(height: 20 * screenHeight / 852),
                  SizedBox(
                    height: 78.5 * screenHeight / 852,
                    width: screenWidth as double,
                    child: ListView.separated(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 14 * screenWidth / 393),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              clickedIndex = index;
                            });
                            switch (clickedIndex) {
                              case 0:
                                Navigator.push(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const CategoryLayout1(check: false)));
                                break;
                              case 1:
                                Navigator.push(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const CategoryLayout1(check: true)));
                                break;
                              case 2:
                                Navigator.push(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const CategoryLayout2(
                                      isOffice: false,
                                      check: false,
                                    )));
                                break;
                              case 3:
                                Navigator.push(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const CategoryLayout2(
                                      isOffice: false,
                                      check: true,
                                    )));
                                break;
                              case 4:
                                Navigator.push(
                                    context,
                                    RouteAnimation.fadeRoute(
                                        const CategoryLayout2(
                                      isOffice: true,
                                      check: false,
                                    )));
                                break;
                            }
                          },
                          child: Container(
                            height: 60.97 * screenHeight / 852,
                            width: 76.97 * screenHeight / 852,
                            decoration: BoxDecoration(
                                color: clickedIndex == index
                                    ? AppColors.salmon
                                    : isDarkMode
                                        ? AppColors.greyDark
                                        : categories[index].boxColor,
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    categories[index].iconPath,
                                    // ignore: deprecated_member_use
                                    color: clickedIndex == index
                                        ? AppColors.terracotta
                                        : categories[index].iconColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15 * screenHeight / 852),
                  Stack(
                    children: [
                      Positioned(
                        top: 31 * screenHeight / 852,
                        child: Container(
                          height: 132 * screenHeight / 852,
                          width: 349 * screenWidth / 393,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.salmon),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 22 * screenHeight / 852,
                                left: 26 * screenWidth / 393),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Kitchen Cart',
                                      style: AppTypography.cardTextTitle),
                                  SizedBox(height: screenHeight * 5 / 852),
                                  SizedBox(
                                    width: screenWidth * 153 / 393,
                                    child: const Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                                        style: AppTypography.descriptionTitle),
                                  ),
                                  SizedBox(height: 13 * screenHeight / 852),
                                  Row(
                                    children: [
                                      AppButton(
                                        onPressed: () {},
                                        height: 25 * screenHeight / 852,
                                        width: 44 * screenWidth / 393,
                                        backgroundColor: AppColors.white,
                                        title: '4.5',
                                        icon: AppIcon.star,
                                        textColor: AppColors.darkLetter,
                                      ),
                                      SizedBox(width: screenWidth * 46 / 393),
                                      AppButton(
                                        onPressed: () {
                                          Cart.addCart(bestSeller.elementAt(1));
                                          Navigator.push(
                                              context,
                                              RouteAnimation.fadeRoute(
                                                  const CartDetail()));
                                        },
                                        title: 'home_screen.shop'.tr(),
                                        height: 20 * screenHeight / 852,
                                        width: 58 * screenWidth / 393,
                                        backgroundColor: AppColors.white,
                                        fontSize: 10.5,
                                        textColor: AppColors.darkLetter,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () => Navigator.push(context,
                                RouteAnimation.fadeRoute(const BestSeller())),
                            child: const Text('Best Seller',
                                style: AppTypography.heading3)),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(AppImage.kitchenCart)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 20 / 852),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                RouteAnimation.fadeRoute(
                                    const NewCollection()));
                          },
                          child: const Text('New Collection',
                              style: AppTypography.heading3)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 10 / 852),
                  SizedBox(
                    height: 245 * screenHeight / 852,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 23 * screenWidth / 393),
                      itemCount: newCollections.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          cardWidth: 163,
                          product: newCollections[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
