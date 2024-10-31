import 'dart:io';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/models/user.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/date_input.dart';
import 'package:furniture_app/widget/input/default_input.dart';
import 'package:furniture_app/widget/input/phone_input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool? _selectedGender;
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    // Initialize user data
    user = User.getDummyUser();

    // Populate controllers with user data
    _fullnameController.text = user?.fullname ?? '';
    _emailController.text = user?.email ?? '';
    _phoneController.text = user?.phone ?? '';
    _dobController.text = user?.dob ?? '';

    // Initialize the selected gender from the user object
    _selectedGender = user?.gender;
  }

  void _handleGenderChange(bool? value) {
    setState(() {
      _selectedGender = value;
    });
  }

  void _updateUserProfile() {
    // Update user data
    setState(() {
      user?.fullname = _fullnameController.text;
      user?.email = _emailController.text;
      user?.phone = _phoneController.text;
      user?.dob = _dobController.text;
      user?.gender = (_selectedGender ?? user?.gender)!;
    });

    User.updateDummyUser(user);

    // Show a Snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();

      // Pick an image from the gallery
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _imageFile = File(image.path); // Update state with the selected image
        });
      }
    } catch (e) {
      // Handle any errors here (e.g., user canceled)
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        title: 'My Profile',
        iconRight: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              height: 175,
                              width: 175,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              height: 175,
                              width: 175,
                              AppImage.avt,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: const ClipOval(
                          child: Material(
                            color: AppColors.salmon,
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.beige : AppColors.salmon,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user!.fullname, style: AppTypography.bodyTextDark),
                      const SizedBox(height: 4),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'ID: ',
                                style: AppTypography.bodyTextDark),
                            TextSpan(
                              text: '25030024',
                              style: AppTypography.bodyTextDark,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Full Name'),
                    const SizedBox(height: 8),
                    DefaultInput(
                      controller: _fullnameController,
                      width: double.infinity,
                      height: 45,
                    ),
                    const SizedBox(height: 10),
                    const Text('Email'),
                    const SizedBox(height: 8),
                    DefaultInput(
                      controller: _emailController,
                      width: double.infinity,
                      height: 45,
                    ),
                    const SizedBox(height: 10),
                    const Text('Phone number'),
                    const SizedBox(height: 8),
                    PhoneNumberInput(
                      controller: _phoneController,
                      width: double.infinity,
                      height: 45,
                    ),
                    const SizedBox(height: 10),
                    const Text('Date of Birth'),
                    const SizedBox(height: 8),
                    DatePickerInput(
                      firstDate: DateTime(1930),
                      lastDate: DateTime(2024),
                      controller: _dobController,
                      width: double.infinity,
                      height: 45,
                    ),
                    const SizedBox(height: 10),
                    const Text('Gender'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _genderRadioButton('Male', true),
                        _genderRadioButton('Female', false),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Center(
                      child: AppButton(
                        onPressed: _updateUserProfile,
                        title: 'Update Profile',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderRadioButton(String label, bool value) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      width: 154,
      height: 49,
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Radio<bool>(
            activeColor: AppColors.salmon,
            value: value,
            groupValue: _selectedGender,
            onChanged: _handleGenderChange,
          ),
          Text(
            label,
            style: TextStyle(
              color: isDarkMode ? AppColors.greyDark : AppColors.darkLetter,
            ),
          ),
        ],
      ),
    );
  }
}
