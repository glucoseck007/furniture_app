
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/animations/route_animation.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/models/user.dart';
import 'package:furniture_app/screen/auth/change_pass_screen.dart';
import 'package:furniture_app/screen/general/help.dart';
import 'package:furniture_app/screen/general/notification.dart';
import 'package:furniture_app/screen/general/settings.dart';
import 'package:furniture_app/screen/home_screen.dart';
import 'package:furniture_app/screen/launch_sreen.dart';
import 'package:furniture_app/screen/profile/edit_profile.dart';
import 'package:furniture_app/screen/profile/payment_method.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/wishlist/wishlist.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? selectedItem;

List ultis = [
  {'icon': AppIcon.privacyIcon, 'label': 'Privacy Policy'},
  {'icon': AppIcon.paymentIcon, 'label': 'Payment Method'},
  {'icon': AppIcon.notificationIcon, 'label': 'Notification'},
  {'icon': AppIcon.settingsIcon, 'label': 'Settings'},
  {'icon': AppIcon.helpIcon, 'label': 'Help'},
  {'icon': AppIcon.logoutIcon, 'label': 'Logout'},
];

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = User.getDummyUser();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pushReplacement(
            context, RouteAnimation.fadeRoute(const HomeScreen())),
        height: 65,
        title: 'My Profile',
        iconRight: [
          Padding(
            padding: EdgeInsets.only(
              right: 24 * MediaQuery.of(context).size.width / 393,
            ),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context, RouteAnimation.fadeRoute(const EditProfile())),
              child: SvgPicture.asset(
                AppIcon.botEdit,
                height: 34,
                width: 34,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  height: 175,
                  width: 175,
                  AppImage.avt,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Text(user?.fullname ?? '',
                  style: isDarkMode
                      ? AppTypography.notiLight
                      : AppTypography.notiDark),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'ID: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            isDarkMode ? AppColors.white : AppColors.darkLetter,
                      ),
                    ),
                    TextSpan(
                      text: '25030024',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color:
                            isDarkMode ? AppColors.white : AppColors.darkLetter,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 81,
                width: 333,
                decoration: BoxDecoration(
                  color: AppColors.salmon,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            RouteAnimation.fadeRoute(const EditProfile()));
                      },
                      child: _buildContent(AppIcon.profileDefault, 'Profile'),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              RouteAnimation.fadeRoute(const WishListScreen()));
                        },
                        child:
                            _buildContent(AppIcon.wishlistDefault, 'Wishlist')),
                    const VerticalDivider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white,
                    ),
                    _buildContent(AppIcon.orderIcon, 'My Orders'),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: ultis.map((item) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal:
                              25.0), // Widen the space between leading and title
                      leading: ClipOval(
                        child: Material(
                          color: AppColors.salmon,
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset(
                                item['icon'],
                                // ignore: deprecated_member_use
                                color: AppColors.greyDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        item['label'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Handle tap events
                        selectedItem = item['label'];
                        switch (selectedItem) {
                          case 'Payment Method':
                            Navigator.push(
                                context,
                                RouteAnimation.fadeRoute(
                                    const PaymentMethodScreen()));
                            break;
                          case 'Settings':
                            Navigator.push(
                                context,
                                RouteAnimation.fadeRoute(
                                    const SettingScreen()));
                            break;
                          case 'Notification':
                            Navigator.push(
                                context,
                                RouteAnimation.fadeRoute(
                                    const NotificationScreen()));
                            break;
                          case 'Privacy Policy':
                            Navigator.push(
                                context,
                                RouteAnimation.fadeRoute(
                                    const ChangePassScreen()));
                            break;
                          case 'Help':
                            Navigator.push(context,
                                RouteAnimation.fadeRoute(const HelpScreen()));
                            break;
                          case 'Logout':
                            _showLogoutDialog(context);
                        }
                        print('${item['label']} tapped');
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildContent(String icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          height: 40,
          width: 40,
          // ignore: deprecated_member_use
          color: AppColors.darkLetter,
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
              color: AppColors.darkLetter, fontFamily: 'League Spartan'),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 216,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    const Text(
                      'Are you sure want to log out?',
                      style: AppTypography.bodyTextDark,
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            title: 'Cancel',
                            height: 37,
                            width: 121,
                          ),
                          AppButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  RouteAnimation.fadeRoute(
                                      const LaunchScreen()));
                            },
                            title: 'Log Out',
                            height: 37,
                            width: 121,
                            textColor: AppColors.brownRosy,
                            backgroundColor: AppColors.beige,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Divider(
                        thickness: 1,
                        color: AppColors.salmon,
                        indent: 55,
                        endIndent: 55)
                  ],
                ),
              ));
        });
  }
}
