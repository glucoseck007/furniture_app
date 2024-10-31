import 'package:flutter/material.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/models/card.dart';
import 'package:furniture_app/screen/profile/profile.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/default_input.dart';
import 'package:furniture_app/widget/input/expiry_date.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  CreditCard card = CreditCard();

  void _handleAddCard() {
    // print('hihi');
    final card = CreditCard(
      holderName: _holderNameController.text,
      cardNumber: _cardNumberController.text,
      expiryDate: _expiryDateController.text,
    );

    card.addCard(card);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added new card successfully!')),
    ); // Pass the card instance to the addCard method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.push(
            context, RouteAnimation.fadeRoute(const ProfileScreen())),
        height: 65,
        title: 'Add New Card',
        iconRight: const [],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 194,
                      width: 324,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.beige,
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 30,
                      child: Text(
                        card.cardNumber ?? '000 0000 000',
                        style: const TextStyle(
                            color: AppColors.darkLetter,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Positioned(
                        top: 120,
                        left: 30,
                        child: Text(
                          'Card holder name',
                          style: AppTypography.smallTextDark,
                        )),
                    Positioned(
                        top: 140,
                        left: 30,
                        child: Text(
                          card.holderName ?? 'Khanh NC',
                          style: AppTypography.smallTextSalmon,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Holder Name',
                    style: AppTypography.bodyTextSalmon,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DefaultInput(
                    controller: _holderNameController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Card Number',
                    style: AppTypography.bodyTextSalmon,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DefaultInput(
                    controller: _cardNumberController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expiry Date',
                            style: AppTypography.bodyTextSalmon,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ExpiryDateInput(
                            controller: _expiryDateController,
                            width: 87,
                          ),
                        ],
                      ),
                      const SizedBox(width: 86),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'CVV',
                            style: AppTypography.bodyTextSalmon,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DefaultInput(
                            width: 87,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 55),
              Center(
                  child: AppButton(
                onPressed: () {
                  _handleAddCard();
                },
                title: 'Add new card',
              ))
            ],
          )),
    );
  }
}
