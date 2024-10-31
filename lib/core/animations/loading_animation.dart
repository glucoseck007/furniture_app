import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_image.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  int _imageIndex = 0;
  late Timer _timer;

  final List<String> _imagePaths = [
    '${AppImage.basePath}loading/progress1.png', // Add your image paths
    '${AppImage.basePath}loading/progress2.png',
    '${AppImage.basePath}loading/progress3.png',
    '${AppImage.basePath}loading/done.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        // If it's the last image (done.png), stop the animation
        if (_imageIndex < _imagePaths.length - 1) {
          _imageIndex++;
        } else {
          _timer.cancel(); // Stop the animation when done.png is reached
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Transform.scale(
        scale: 2,
        child: Image.asset(
          _imagePaths[_imageIndex],
          height: 215, // Set the desired height
          width: 215, // Set the desired width
        ),
      ),
    );
  }
}
