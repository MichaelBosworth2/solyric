import 'package:flutter/material.dart';

import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';
import 'package:solyric_app/app/ui/onboarding/widget/OnBoardingFirstStep.dart';
import 'package:solyric_app/app/ui/onboarding/widget/OnBoardingLastStep.dart';
import 'package:solyric_app/app/ui/onboarding/widget/OnBoardingStep.dart';
import 'package:solyric_app/app/ui/onboarding/widget/PageIndicator.dart';

import 'package:solyric_app/app/utils/Resources.dart';

class OnBoadingScreen extends StatefulWidget {
  @override
  _OnBoadingScreenState createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  final int _totalPages = 8;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                OnBoardingFirstStep(
                    image: Resources.IMAGE_A,
                    title: Resources.TITLE_MESSAGE_A,
                    text: Resources.TEXT_MESSAGE_A,
                    background: Resources.BACKGROUND_A),
                OnBoardingStep(
                    image: Resources.IMAGE_B,
                    title: Resources.TITLE_MESSAGE_B,
                    text: Resources.TEXT_MESSAGE_B,
                    background: Resources.BACKGROUND_B,
                    bottom: height / 4.5,
                    left: -20,
                    width: width / 1.2),
                OnBoardingStep(
                    image: Resources.IMAGE_C,
                    title: Resources.TITLE_MESSAGE_C,
                    text: Resources.TEXT_MESSAGE_C,
                    background: Resources.BACKGROUND_C,
                    bottom: height / 3.5,
                    right: -50,
                    width: width / 1.2),
                OnBoardingStep(
                    image: Resources.IMAGE_D,
                    title: Resources.TITLE_MESSAGE_D,
                    text: Resources.TEXT_MESSAGE_D,
                    background: Resources.BACKGROUND_D,
                    top: height / 7,
                    right: -40,
                    width: width / 1.2),
                OnBoardingStep(
                    image: Resources.IMAGE_E,
                    title: Resources.TITLE_MESSAGE_E,
                    text: Resources.TEXT_MESSAGE_E,
                    background: Resources.BACKGROUND_E,
                    top: height / 7,
                    right: -40,
                    width: width / 1.2),
                OnBoardingStep(
                    image: Resources.IMAGE_F,
                    title: Resources.TITLE_MESSAGE_F,
                    text: Resources.TEXT_MESSAGE_F,
                    background: Resources.BACKGROUND_F,
                    top: height / 7,
                    right: -40,
                    width: width / 1.2),
                OnBoardingStep(
                    image: Resources.IMAGE_G,
                    title: Resources.TITLE_MESSAGE_G,
                    text: Resources.TEXT_MESSAGE_G,
                    background: Resources.BACKGROUND_G,
                    top: -height / 16,
                    left: -width / 5,
                    width: width / 0.8
                    // width: width / 0.4
                    ),
                OnBoardingLastStep(),
              ],
            ),
            Positioned(
              top: 40,
              width: width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _showLogo(),
                    InkWell(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: _currentPage == 7
                          ? Container()
                          : Text(
                              'Skip',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 40,
                width: width,
                child: Container(
                  // alignment: Alignment.center,
                  child: _currentPage == 7
                      ? null
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              for (int i = 0; i < _totalPages; i++)
                                i == _currentPage
                                    ? PageIndicator(isCurrentPage: true)
                                    : PageIndicator(isCurrentPage: false)
                            ]),
                ))
          ],
        ),
      ),
    );
  }

  Widget _showLogo() {
    return Container(
      child: (_currentPage == 0 || _currentPage == 7)
          ? null
          : Image.asset(
              'assets/solyric_logo.png',
              width: MediaQuery.of(context).size.width / 4,
            ),
    );
  }
}
