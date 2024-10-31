import 'package:flutter/material.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/review_card.dart';

class UserReviewScreen extends StatefulWidget {
  const UserReviewScreen({super.key});

  @override
  State<UserReviewScreen> createState() => _UserReviewScreenState();
}

class _UserReviewScreenState extends State<UserReviewScreen> {
  final List<Map<String, dynamic>> cardData = [
    {
      'name': 'Wade',
      'description':
          'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
      'imagePath': 'assets/images/avatar1.png',
      'rating': 5,
      'views': 654,
    },
    {
      'name': 'John',
      'description':
          'Praesent ultricies justo et felis aliquet, ac aliquet metus facilisis.',
      'imagePath': 'assets/images/avatar2.png',
      'rating': 4,
      'views': 340,
    },
    {
      'name': 'Emily',
      'description':
          'Donec vehicula lorem non magna fringilla, nec condimentum massa accumsan.',
      'imagePath': 'assets/images/avatar3.png',
      'rating': 5,
      'views': 502,
    },
    {
      'name': 'Sophia',
      'description': 'Mauris eget risus aliquam, tempus nunc id, auctor arcu.',
      'imagePath': 'assets/images/avatar4.png',
      'rating': 3,
      'views': 123,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Reviews',
        height: 65,
        iconRight: const [],
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            final item = cardData[index];
            return ReviewCard(
              name: item['name'],
              description: item['description'],
              imagePath: item['imagePath'],
              rating: item['rating'],
              views: item['views'],
            );
          },
        ),
      ),
    );
  }
}
