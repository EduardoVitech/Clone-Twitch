import 'package:flutter/material.dart';
import 'package:twitch_clone/resources/auth_methods/auth_methods.dart';
import 'package:twitch_clone/responsive/responsive.dart';
import 'package:twitch_clone/utils/colors/colors.dart';
import 'package:twitch_clone/widgets/custom_button/custom_button.dart';
import 'package:twitch_clone/widgets/custom_textfield/custom_textfield.dart';
import 'package:twitch_clone/widgets/loading_indicator/loading_indicator.dart';
import '../home_page/home_page.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    bool res = await _authMethods.signUpUsers(
      context,
      _emailController.text,
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : Responsive(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(controller: _emailController),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(controller: _usernameController),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          controller: _passwordController,
                          passwordVisible: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Sign Up',
                        onTap: signUpUser,
                        colorButton: buttonColor,
                        colortext: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
