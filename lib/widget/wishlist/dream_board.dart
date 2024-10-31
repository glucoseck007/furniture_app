import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/wishlist/wishlist.dart';
// import 'package:furniture_app/widget/wishlist/wishlist.dart';

class DreamBoard extends StatefulWidget {
  const DreamBoard({super.key});

  @override
  State<DreamBoard> createState() => _DreamBoardState();
}

TextEditingController _controller = TextEditingController();

class _DreamBoardState extends State<DreamBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: CustomAppBar(
        height: 65,
        title: '',
        iconLeft: AppIcon.leftArrow,
        leftColor: AppColors.terracotta,
        iconRight: const [],
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.elegantChair),
              const SizedBox(height: 28),
              const Text(
                'Create Your Board',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.salmon),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(
                    color: AppColors.salmon, // Text color
                    fontSize: 15.0, // Font size
                  ),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.salmon, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.salmon, width: 1.0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.salmon, width: 1.0))),
                ),
              ),
              const SizedBox(height: 38),
              AppButton(
                onPressed: () {
                  // print(_controller.text);
                  Navigator.push(
                      context,
                      RouteAnimation.fadeRoute(WishListScreen(
                        boardTitle: _controller.text,
                      )));
                },
                title: 'Next',
                width: 186,
                textColor: AppColors.terracotta,
              )
            ],
          ),
        ),
      ),
    );
  }
}
