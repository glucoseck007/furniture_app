import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/screen/product-screen/desk.dart';
import 'package:furniture_app/screen/product-screen/dining.dart';
import 'package:furniture_app/screen/product-screen/kitchen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';

class CategoryLayout2 extends StatefulWidget {
  final bool check;
  final bool isOffice;

  const CategoryLayout2(
      {super.key, required this.check, required this.isOffice});

  @override
  State<CategoryLayout2> createState() => _CategoryLayout2State();
}

class _CategoryLayout2State extends State<CategoryLayout2> {
  String? clickedButton; // Track which button was clicked
  String? randomFlippedButton; // Track the random flipped button
  double scaleFactor = 1.0; // Scale factor for button press
  Timer? flipTimer; // Timer for random flip logic

  @override
  void initState() {
    super.initState();
    startRandomFlip(); // Start flipping random buttons periodically
  }

  @override
  void dispose() {
    flipTimer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  List<Map<String, dynamic>> get _categories {
    if (widget.isOffice) {
      return [
        {
          'title': 'Desk',
          'height': 85.0,
          'width': 170.0,
          'image': AppImage.ohoverDesk
        },
        {
          'title': 'Chairs',
          'height': 256.0,
          'width': 166.0,
          'image': AppImage.ohoverChair
        },
        {
          'title': 'Lights',
          'height': 272.0,
          'width': 166.0,
          'image': AppImage.ohoverLight
        },
        {
          'title': 'Organizer',
          'height': 294.0,
          'width': 166.0,
          'image': AppImage.ohoverOrganizer,
          'right': true
        },
        {
          'title': 'Decor',
          'height': 332.0,
          'width': 166.0,
          'image': AppImage.ohoverDecor,
          'right': true
        },
      ];
    } else if (widget.check) {
      return [
        {
          'title': 'Auxiliary\nFurniture',
          'height': 85.0,
          'width': 170.0,
          'image': AppImage.khoverAuxiliary
        },
        {
          'title': 'Lights',
          'height': 256.0,
          'width': 166.0,
          'image': AppImage.khoverLight
        },
        {
          'title': 'Chairs',
          'height': 272.0,
          'width': 166.0,
          'image': AppImage.khoverChair
        },
        {
          'title': 'Storage',
          'height': 145.0,
          'width': 166.0,
          'image': AppImage.khoverStorage,
          'right': true
        },
        {
          'title': 'Tables',
          'height': 137.0,
          'width': 166.0,
          'image': AppImage.khoverTable,
          'right': true
        },
        {
          'title': 'Decor',
          'height': 332.0,
          'width': 166.0,
          'image': AppImage.khoverDecor,
          'right': true
        },
      ];
    } else {
      return [
        {
          'title': 'Chairs',
          'height': 85.0,
          'width': 170.0,
          'image': AppImage.dhoverChair
        },
        {
          'title': 'Storage',
          'height': 256.0,
          'width': 166.0,
          'image': AppImage.dhoverStorage
        },
        {
          'title': 'Dining\nTables',
          'height': 272.0,
          'width': 166.0,
          'image': AppImage.dhoverDiningTable
        },
        {
          'title': 'Tables',
          'height': 145.0,
          'width': 166.0,
          'image': AppImage.dhoverTable,
          'right': true
        },
        {
          'title': 'Decorative\nLight',
          'height': 137.0,
          'width': 166.0,
          'image': AppImage.dhoverLight,
          'right': true
        },
        {
          'title': 'Decor',
          'height': 332.0,
          'width': 166.0,
          'image': AppImage.dhoverDecor,
          'right': true
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pushReplacement(
          context,
          RouteAnimation.fadeRoute(const HomeScreen()),
        ),
        height: 65,
        title: widget.isOffice
            ? 'Office'
            : widget.check
                ? 'Kitchen'
                : 'Dining Room',
      ),
      bottomNavigationBar: const BottomNavigatorBar(),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight * 0.85,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 25 / 393),
            child: Stack(
              children: _buildButtons(screenHeight, screenWidth),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(double screenHeight, double screenWidth) {
    List<Widget> buttons = [];
    double leftTopOffset = 32.0; // For left-aligned buttons
    double rightTopOffset = 32.0; // For right-aligned buttons

    for (var category in _categories) {
      bool isRight = category['right'] ?? false;
      double height = category['height'] * screenHeight / 852;
      double width = category['width'] * screenWidth / 393;

      buttons.add(Positioned(
        top: isRight
            ? rightTopOffset * screenHeight / 852
            : leftTopOffset * screenHeight / 852,
        right: isRight ? 0 : null,
        left: isRight ? null : 0,
        child: randomFlippedButton == category['title']
            ? AnimatedScale(
                scale: scaleFactor,
                duration: const Duration(milliseconds: 150),
                child: _buildImage(
                    category['image'], height, width, category['title']),
              )
            : GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    scaleFactor = 0.95; // Scale down on press
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    scaleFactor = 1.0; // Scale back to normal
                  });
                },
                onTapCancel: () {
                  setState(() {
                    scaleFactor = 1.0; // Scale back to normal on cancel
                  });
                },
                child: AppButton(
                  onPressed: () {
                    setState(() {
                      clickedButton =
                          category['title']; // Set the clicked button
                      _navigateScreen(category['title']);
                    });
                  },
                  borderRadius: 15,
                  height: height,
                  width: width,
                  title: category['title'],
                  textStyle: AppTypography.categoryTitle,
                ),
              ),
      ));

      if (isRight) {
        rightTopOffset +=
            height + 11; // Increase topOffset for the next right button
      } else {
        leftTopOffset +=
            height + 11; // Increase topOffset for the next left button
      }
    }

    return buttons;
  }

  Widget _buildImage(
      String imagePath, double height, double width, String title) {
    return GestureDetector(
      onTap: () => _navigateScreen(title),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(15), // Optional: for rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _navigateScreen(String title) {
    Widget? screen;
    switch (title) {
      case 'Auxiliary\nFurniture':
        screen = const KitchenScreen();
        break;
      case 'Desk':
        screen = const DeskScreen();
        break;
      case 'Dining\nTables':
        screen = const DiningScreen();
        break;
      // Add other cases as necessary
      default:
        screen = null; // Handle unknown titles if necessary
    }
    // Navigate to the corresponding screen
    if (screen != null) {
      Navigator.push(context, RouteAnimation.fadeRoute(screen));
    }
  }

  // Logic to flip a random button for 2 seconds
  void startRandomFlip() {
    flipTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      int randomIndex =
          Random().nextInt(_categories.length); // Get a random category index
      String randomCategory = _categories[randomIndex]['title'];

      setState(() {
        randomFlippedButton = randomCategory; // Flip the random button
      });

      // Unflip after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          randomFlippedButton = null; // Unflip back to normal
        });
      });
    });
  }
}
