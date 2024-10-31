import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/constants/app_icon.dart';
import 'package:furniture_app/core/constants/app_typography.dart';
import 'package:furniture_app/core/theme/app_color.dart';
import 'package:furniture_app/core/theme/theme_provider.dart';
import 'package:furniture_app/widget/app_bar.dart';
import 'package:furniture_app/widget/app_button.dart';
import 'package:furniture_app/widget/bottom_navigator.dart';
import 'package:furniture_app/widget/input/input_field.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

String holder = 'Lorem ipsum dolor sit amet?';

final List<Map<String, String>> faqs = [
  {
    "question": "Lorem ipsum dolor sit amet?",
    "answer": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  },
  {
    "question": "Lorem ipsum dolor sit amet?",
    "answer":
        "Praesent pellentesque congue lorem, vel tincidunt tortor placerat a."
  },
  {
    "question": "Lorem ipsum dolor sit amet?",
    "answer": "Aenean in sagittis magna, ut feugiat diam."
  },
  {
    "question": "Lorem ipsum dolor sit amet?",
    "answer": "Etiam non ligula purus."
  },
  {
    "question": "Lorem ipsum dolor sit amet?",
    "answer": "Nulla facilisi. In eget felis in lorem."
  },
];

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      bottomNavigationBar: const BottomNavigatorBar(),
      appBar: CustomAppBar(
        onLeadingPressed: () => Navigator.pop(context),
        height: 65,
        iconRight: const [],
        title: 'Help & FAQs',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              'How Can We Help You?',
              style: isDarkMode
                  ? AppTypography.bodyText
                  : AppTypography.bodyTextDark,
            ),
            const SizedBox(height: 10),
            const dividerBar(),
            const SizedBox(height: 5),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppButton(
                        onPressed: () {},
                        title: 'FAQ',
                        height: 25,
                        width: 158,
                        textColor: isDarkMode
                            ? AppColors.salmon
                            : AppColors.terracotta,
                        backgroundColor:
                            isDarkMode ? AppColors.greyDark : AppColors.salmon),
                    AppButton(
                        onPressed: () {
                          setState(() {});
                        },
                        title: 'Contact Us',
                        height: 25,
                        width: 158,
                        textColor:
                            isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                        backgroundColor:
                            isDarkMode ? AppColors.greyDark : AppColors.beige)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppButton(
                        onPressed: () {},
                        title: 'General',
                        height: 25,
                        width: 104,
                        textColor:
                            isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                        backgroundColor:
                            isDarkMode ? AppColors.greyDark : AppColors.beige),
                    AppButton(
                        onPressed: () {
                          setState(() {});
                        },
                        title: 'Account',
                        height: 25,
                        width: 104,
                        textColor:
                            isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                        backgroundColor:
                            isDarkMode ? AppColors.greyDark : AppColors.beige),
                    AppButton(
                        onPressed: () {
                          setState(() {});
                        },
                        title: 'Services',
                        height: 25,
                        width: 104,
                        textColor:
                            isDarkMode ? AppColors.salmon : AppColors.brownRosy,
                        backgroundColor:
                            isDarkMode ? AppColors.greyDark : AppColors.beige)
                  ],
                ),
                const SizedBox(height: 20),
                InputField(
                  width: 330 * screenWidth / 393,
                  // height: 34,
                  label: 'Search',
                  borderColor: AppColors.beige,
                  suffixIcon: IconButton(
                      // onPressed: () => Navigator.push(context,
                      //     RouteAnimation.fadeRoute(const FilterScreen())),
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcon.filter)),
                ),
                const SizedBox(height: 5),
                const dividerBar(),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.58,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: faqs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  faqs[index]["question"]!,
                                  style: AppTypography.bodyTextSalmon,
                                ),
                                trailing: SvgPicture.asset(AppIcon.vv),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        faqs[index]["answer"]!,
                                        style: isDarkMode
                                            ? AppTypography.bodyText
                                            : AppTypography.bodyTextDark,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const dividerBar()
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class dividerBar extends StatelessWidget {
  const dividerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.salmon,
      indent: 15,
      endIndent: 15,
    );
  }
}
