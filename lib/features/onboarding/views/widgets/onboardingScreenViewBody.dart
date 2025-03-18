import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:guessit_task/core/theme/color_app.dart';
import 'package:guessit_task/core/theme/styles.dart';
import 'package:guessit_task/features/login/presentation/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreenViewBody extends StatefulWidget {
  @override
  _OnboardingScreenViewBodyState createState() => _OnboardingScreenViewBodyState();
}

class _OnboardingScreenViewBodyState extends State<OnboardingScreenViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> onDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  void onNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      onDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset('assets/Logo(1).png', width: 80),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage('Find your talent With us', 'assets/illus1.png'),
              _buildPage('Pursue your dream', 'assets/smart-people.png'),
              _buildPage("Let's go fishing", 'assets/payment-processed.png'),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 44 : 10,
                    height: 9,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? ColorApp.primaryColor : ColorApp.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onNext,
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorApp.primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      _currentPage == 2 ? 'Get Started' : 'Next',
                      style: Styles.textStyle16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 282, height: 229),
        SizedBox(height: 20),
        Text(title, style: Styles.textStyle24, textAlign: TextAlign.center),
      ],
    );
  }
}
