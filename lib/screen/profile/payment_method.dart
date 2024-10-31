import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/models/card.dart';
import 'package:furniture_app/screen/profile/add_new_card.dart';
import 'package:furniture_app/screen/profile/profile.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod? _selectedMethod = PaymentMethod.credit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.push(
            context, RouteAnimation.fadeRoute(const ProfileScreen())),
        height: 65,
        title: 'Payment Method',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (CreditCard.creditCards.isEmpty) ...[
                buildEmptyCardOption(),
              ] else ...[
                ...CreditCard.creditCards.map((card) {
                  return Column(
                    children: [
                      buildPaymentOption(
                        title: card.cardNumber ?? '',
                        icon: Icons.credit_card,
                        svgIcon: AppIcon.card,
                        paymentMethod: PaymentMethod.credit,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.white,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ],
                  );
                }),
              ],
              buildPaymentOption(
                title: 'Apple Pay',
                icon: Icons.phone_iphone,
                svgIcon: AppIcon.apple,
                paymentMethod: PaymentMethod.apple,
              ),
              const Divider(
                  thickness: 1,
                  color: AppColors.white,
                  indent: 15,
                  endIndent: 15),
              buildPaymentOption(
                title: 'Paypal',
                icon: Icons.credit_card,
                svgIcon: AppIcon.paypal,
                paymentMethod: PaymentMethod.paypal,
              ),
              const Divider(
                  thickness: 1,
                  color: AppColors.white,
                  indent: 15,
                  endIndent: 15),
              buildPaymentOption(
                title: 'Cash',
                svgIcon: AppIcon.cash,
                icon: Icons.money_off,
                paymentMethod: PaymentMethod.cash,
              ),
              const SizedBox(height: 35),
              AppButton(
                onPressed: () {
                  Navigator.push(context,
                      RouteAnimation.fadeRoute(const AddNewCardScreen()));
                },
                title: 'Add New Card',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmptyCardOption() {
    return Column(
      children: [
        buildPaymentOption(
          title: 'No Credit Cards Added',
          icon: Icons.credit_card,
          svgIcon: AppIcon.card,
          paymentMethod: PaymentMethod.credit,
        ),
        const Divider(
          thickness: 1,
          color: AppColors.white,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }

  Widget buildPaymentOption({
    required String title,
    required IconData icon,
    required PaymentMethod paymentMethod,
    String? svgIcon,
  }) {
    return ListTile(
      title: Text(title),
      leading: svgIcon == null
          ? Icon(icon, color: Colors.white)
          : SvgPicture.asset(svgIcon),
      trailing: Radio<PaymentMethod>(
        value: paymentMethod,
        activeColor: AppColors.salmon,
        groupValue: _selectedMethod,
        onChanged: (PaymentMethod? value) {
          setState(() {
            _selectedMethod = value;
          });
        },
      ),
    );
  }
}

enum PaymentMethod { cash, paypal, apple, credit }
