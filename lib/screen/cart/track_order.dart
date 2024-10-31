import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        height: 65,
        title: 'Track Order',
        iconRight: [
          Padding(padding: EdgeInsets.only(right: 24 * screenWidth / 393)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 14 * screenHeight / 853,
            horizontal: screenWidth * 25 / 393,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShipAdress(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              SizedBox(height: 28 * screenHeight / 852),
              Stack(
                children: [
                  Container(
                    height: 184 * screenHeight / 852,
                    width: 343 * screenWidth / 393,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.1)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11.1),
                      child: Image.asset(
                        AppImage.map,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    bottom: 69,
                    left: 113,
                    right: 126,
                    child: Transform.scale(
                      scale: 0.8,
                      child: SvgPicture.asset(AppIcon.line12),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 99,
                    right: 224,
                    bottom: 139,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.salmon,
                      ),
                      child: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset(
                          AppIcon.mock,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 103,
                    left: 203,
                    right: 97,
                    bottom: 58,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.salmon,
                      ),
                      child: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset(
                          AppIcon.mock,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28 * screenHeight / 852),
              _buildDeliveryTime(screenHeight: screenHeight),
              SizedBox(height: 18 * screenHeight / 852),
              const Divider(
                color: AppColors.salmon,
                thickness: 1,
              ),
              SizedBox(height: 18 * screenHeight / 852),
              // Using ListView.builder with shrinkWrap to avoid layout errors.
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Define the timeline texts and times for each step.
                  final steps = [
                    {
                      'text': 'Your order has been accepted',
                      'time': '2 min',
                      'isFirst': true,
                      'isActive': true,
                    },
                    {
                      'text':
                          'Order has been processed and is ready to be shipped',
                      'time': '21 min',
                      'isFirst': false,
                      'isActive': false,
                    },
                    {
                      'text': 'The delivery is on his way',
                      'time': '23 min',
                      'isFirst': false,
                      'isActive': false,
                    },
                    {
                      'text': 'Your order has been delivered',
                      'time': '15 min',
                      'isFirst': false,
                      'isActive': false,
                      'isLast': true,
                    },
                  ];
                  final step = steps[index];
                  return _buildTimelineTile(
                    context,
                    step['text'] as String,
                    step['time'] as String,
                    isFirst: step['isFirst'] as bool? ?? false,
                    isLast: step['isLast'] as bool? ?? false,
                    isActive: step['isActive'] as bool? ?? false,
                  );
                },
              ),
              SizedBox(
                height: 38 * screenHeight / 852,
              ),
              Center(
                child: AppButton(
                  onPressed: () {
                    Navigator.push(
                        context, RouteAnimation.fadeRoute(const HomeScreen()));
                  },
                  title: 'Return Home',
                  width: screenWidth * 0.4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTimelineTile(BuildContext context, String text, String time,
    {bool isFirst = false, bool isLast = false, bool isActive = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        children: [
          // Top line
          if (!isFirst)
            Container(
              height: 15,
              width: 1.5,
              color: AppColors.salmon,
            ),
          // Circle
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.salmon : Colors.white,
              border: Border.all(
                color: AppColors.salmon,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
          ),
          // Bottom line
          if (!isLast)
            Container(
              height: 15,
              width: 1.5,
              color: AppColors.salmon,
            ),
        ],
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkLetter,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 16),
      Text(
        time,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.salmon,
        ),
      ),
    ],
  );
}

class _buildShipAdress extends StatelessWidget {
  const _buildShipAdress({
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shipping Address',
                    style: TextStyle(
                      color: AppColors.terracotta,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(AppIcon.botEdit),
                ],
              ),
              SizedBox(
                height: screenHeight * 12 / 852,
              ),
              Container(
                height: 99 * screenHeight / 852,
                width: screenWidth - 47,
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14 * screenHeight / 852),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kathryn Murphy',
                        style: TextStyle(
                          color: AppColors.terracotta,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '2464 Royal Ln. Mesa, New Jersey 45463',
                        style: TextStyle(
                          color: AppColors.darkLetter,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '(302) 555-0107 - (406) 555-0120',
                        style: TextStyle(
                          color: AppColors.darkLetter,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _buildDeliveryTime extends StatelessWidget {
  const _buildDeliveryTime({
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Time',
          style: TextStyle(
              color: AppColors.terracotta,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20 * screenHeight / 852),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Estimated Delivery',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkLetter),
            ),
            Text(
              '1 Hour, 25 Mins',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.salmon),
            )
          ],
        )
      ],
    );
  }
}
