import 'package:flutter/material.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Browser'),
      ),
    );
  }
}
