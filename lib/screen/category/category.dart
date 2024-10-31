import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
// import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/layout/category_layout_1.dart';
import 'package:furniture_app/layout/category_layout_2.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
// import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.boardTitle});

  final String? boardTitle;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedCate;

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // final isDarkMode = themeProvider.isDarkMode;

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final List<String> labels = [
      'Living Room',
      'Bedroom',
      'Kitchen',
      'Dining Room'
    ];

    return Scaffold(
      appBar: CustomAppBar(
        iconRight: const [],
        title: 'Category',
        height: 65,
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
              SizedBox(height: screenHeight * 45.45 / 852),
              SizedBox(height: 21 * screenHeight / 852),
              ...List.generate(
                labels.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 20 *
                        screenHeight /
                        852, // Adjust spacing between fields
                  ),
                  child: AppButton(
                    title: labels[index],
                    width:
                        342 * screenWidth / 393, // Set width for input fields
                    height: 50 * screenHeight / 852,
                    onPressed: () {
                      setState(() {
                        selectedCate = labels[index];
                      });
                      switch (selectedCate) {
                        case 'Living Room':
                          Navigator.push(
                              context,
                              RouteAnimation.fadeRoute(
                                  const CategoryLayout1(check: false)));
                          break;
                        case 'Bedroom':
                          Navigator.push(
                              context,
                              RouteAnimation.fadeRoute(
                                  const CategoryLayout1(check: true)));
                          break;
                        case 'Kitchen':
                          Navigator.push(
                              context,
                              RouteAnimation.fadeRoute(const CategoryLayout2(
                                  isOffice: false, check: true)));
                          break;
                        case 'Dining Room':
                          Navigator.push(
                              context,
                              RouteAnimation.fadeRoute(const CategoryLayout2(
                                  isOffice: false, check: false)));
                          break;
                      }
                    }, // Set height for input fields
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
