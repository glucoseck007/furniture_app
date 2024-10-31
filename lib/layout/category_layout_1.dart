import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/screen/product-screen/beds.dart';
import 'package:furniture_app/screen/product-screen/sofa.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';

class CategoryLayout1 extends StatefulWidget {
  final bool check;

  const CategoryLayout1({super.key, required this.check});

  @override
  State<CategoryLayout1> createState() => _CategoryLayout1State();
}

class _CategoryLayout1State extends State<CategoryLayout1> {
  String? clickedButton; // Track which button was clicked
  String? randomFlippedButton; // Track the button that was randomly flipped
  double scaleFactor = 1.0; // Scale factor for animation
  Timer? flipTimer; // Timer for flipping logic

  @override
  void initState() {
    super.initState();
    startRandomFlip(); // Start flipping when widget initializes
  }

  @override
  void dispose() {
    flipTimer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  List<Map<String, dynamic>> get _categories {
    return [
      {
        'title': 'Decorative\nLights',
        'height': 85.0,
        'width': 170.0,
        'image': widget.check ? AppImage.bhoverMirror : AppImage.lhoverMirror
      },
      {
        'title': widget.check ? 'Beds' : 'Lights',
        'height': 256.0,
        'width': 166.0,
        'image': widget.check ? AppImage.bhoverBeds : AppImage.lhoverLight
      },
      {
        'title': 'Chairs',
        'height': 144.0,
        'width': 166.0,
        'image': widget.check ? AppImage.bhoverChair : AppImage.lhoverChair
      },
      {
        'title': 'Sofa',
        'height': 145.0,
        'width': 166.0,
        'image': widget.check ? AppImage.bhoverSofa : AppImage.lhoverSofa,
        'right': true
      },
      {
        'title': 'Tables',
        'height': 137.0,
        'width': 166.0,
        'image': widget.check ? AppImage.bhoverTable : AppImage.lhoverTable,
        'right': true
      },
      {
        'title': 'Cupboard',
        'height': 204.0,
        'width': 166.0,
        'image':
            widget.check ? AppImage.bhoverCupboard : AppImage.lhoverCupboard,
        'right': true
      },
      {
        'title': 'Decor',
        'height': 117.0,
        'width': 344.0,
        'image': widget.check ? AppImage.bhoverDecor : AppImage.lhoverDecor,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: widget.check ? 'Bedroom' : 'Living Room',
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
                child: _buildAppButton(
                  category['title'],
                  height,
                  width,
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

  Widget _buildAppButton(String title, double height, double width) {
    return AppButton(
      onPressed: () {
        setState(() {
          clickedButton = title; // Set the clicked button
          print(title);
          _navigateScreen(title);
        });
      },
      borderRadius: 15,
      height: height,
      width: width,
      title: title,
      textStyle: AppTypography.categoryTitle,
    );
  }

  Widget _buildImage(
      String imagePath, double height, double width, String title) {
    return GestureDetector(
      onTap: () => _navigateScreen(title),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(15), // Optional, for rounded corners
        child: Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _navigateScreen(String title) {
    Widget? screen;
    switch (title) {
      case 'Decorative\nLights':
        // screen = LightScreen();
        break;
      case 'Beds':
        screen = const BedsScreen();
        break;
      case 'Chairs':
        // screen = ChairScreen(); // Replace with your actual screen
        break;
      case 'Sofa':
        screen = const SofaScreen();
        break;
      case 'Tables':
        // screen = TableScreen();
        break;
      case 'Cupboard':
        // screen = CupboardScreen();
        break;
      case 'Decor':
        // screen = DecorScreen();
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
        randomFlippedButton = randomCategory; // Flip this button to image
      });

      // After 2 seconds, revert the button back
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          randomFlippedButton = null; // Reset flipped button
        });
      });
    });
  }
}
