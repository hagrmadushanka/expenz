import 'package:expenz/constants/colors.dart';
import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // page controller.
  final PageController _controller = PageController();
  bool showDetailPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onboarding Screens
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailPage = index == 3;
                      print(showDetailPage);
                    });
                  },

                  children: [
                    //frontt page
                    const FrontPage(),

                    // Onboarding 1
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[0].title,
                      imageParth:
                          OnBoardingData.onboardingDataList[0].imagePath,
                      description:
                          OnBoardingData.onboardingDataList[0].description,
                    ),

                    //Onboarding 2
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[1].title,
                      imageParth:
                          OnBoardingData.onboardingDataList[1].imagePath,
                      description:
                          OnBoardingData.onboardingDataList[1].description,
                    ),

                    //Onboarding 3
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[2].title,
                      imageParth:
                          OnBoardingData.onboardingDataList[2].imagePath,
                      description:
                          OnBoardingData.onboardingDataList[2].description,
                    ),
                  ],
                ),

                // page dote indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                // Navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: Duration(microseconds: 400),
                                curve: Curves.bounceInOut,
                              );
                            },

                            child: CustomButton(
                              buttonName: showDetailPage
                                  ? "Get Started"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              // navigate to the user deta screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserDataScreen(),
                                ),
                              );
                            },

                            child: CustomButton(
                              buttonName: showDetailPage
                                  ? "Get Started"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
