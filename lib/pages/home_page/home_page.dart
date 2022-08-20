import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider/user_provider.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Center(child: Text(userProvider.user.username)),
    );
  }
}
