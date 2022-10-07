import 'package:flutter/material.dart';
import 'package:twitch_clone/pages/login_page/login_page.dart';
import 'package:twitch_clone/pages/signup_page/signup_pagesignup_page.dart';
import 'package:twitch_clone/responsive/responsive.dart';
import 'package:twitch_clone/utils/colors/colors.dart';
import 'package:twitch_clone/widgets/custom_button/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to \n Twitch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomButton(
                  text: 'Log in',
                  colorButton: buttonColor,
                  colortext: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                ),
              ),
              CustomButton(
                text: 'Sign Up',
                colortext: Colors.black,
                colorButton: secondaryBackgroundColor,
                onTap: () {
                  Navigator.pushNamed(context, SignupPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
