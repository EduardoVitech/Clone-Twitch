import 'package:flutter/material.dart';
import 'package:twitch_clone/utils/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final passwordVisible;
  const CustomTextField({
    super.key,
    required this.controller,
    this.passwordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: passwordVisible,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: buttonColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryBackgroundColor,
          ),
        ),
      ),
    );
  }
}
