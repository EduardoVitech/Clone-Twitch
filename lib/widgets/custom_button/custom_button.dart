import 'package:flutter/material.dart';
import 'package:twitch_clone/utils/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.colorButton,
    required this.colortext,
  });
  final String text;
  final VoidCallback onTap;
  final Color colorButton;
  final Color colortext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: colortext,
        ),
      ),
    );
  }
}
