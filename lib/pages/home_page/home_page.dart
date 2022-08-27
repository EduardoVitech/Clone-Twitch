import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/pages/browser_page/browser_page.dart';
import 'package:twitch_clone/pages/feed_page/feed_page.dart';
import 'package:twitch_clone/pages/go_live_page/go_live_page.dart';
import 'package:twitch_clone/utils/colors/colors.dart';
import '../../providers/user_provider/user_provider.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  List<Widget> pages = [
    const FeedPage(),
    const GoLivePage(),
    const BrowserPage(),
  ];

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: primaryColor,
        backgroundColor: backgroundColor,
        unselectedFontSize: 12,
        onTap: onPageChange,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Go Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: 'Browse',
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}
