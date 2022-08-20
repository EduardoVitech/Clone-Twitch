import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/pages/home_page/home_page.dart';
import 'package:twitch_clone/pages/login_page/login_page.dart';
import 'package:twitch_clone/pages/onboarding_page/onboarding_page.dart';
import 'package:twitch_clone/pages/signup_page/signup_pagesignup_page.dart';
import 'package:twitch_clone/providers/user_provider/user_provider.dart';
import 'package:twitch_clone/utils/colors/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone Twitch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
        ),
      ),
      home: const OnboardingPage(),
      routes: {
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignupPage.routeName: (context) => const SignupPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
