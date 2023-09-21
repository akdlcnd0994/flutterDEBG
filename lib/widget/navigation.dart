import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/dictionary_screen.dart';
import '../screens/health_check_screen.dart';
import '../screens/home_screen.dart';
import '../screens/my_info_screen.dart';
import '../screens/search_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  get navigationelements => null;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        elevation: 1.0,
        indicatorColor: Colors.teal[200],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.manage_search),
            icon: Icon(Icons.manage_search_outlined),
            label: '질환백과',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.article),
            icon: Icon(Icons.article_outlined),
            label: '문진',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Q&A',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: '내정보',
          ),
        ],
      ),
      body: <Widget>[
        DicionaryScreen(),
        healthCheckScreen(),
        homeScreen(),
        SearchScreen(),
        MyInfoScreen(),
      ][currentPageIndex],
    );
  }
}
