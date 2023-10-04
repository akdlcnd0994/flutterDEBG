import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
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
        healthCheckScreen(),
        homeScreen(),
        SearchScreen(),
        MyInfoScreen(),
      ][currentPageIndex],
      endDrawer: Drawer(
        // Container 를 이용해서 배경을 짙은 회색으로 설정
        child: Container(
          color: Colors.grey[900],
          // Column 추가
          child: Column(
            children: [
              // Drawer 헤더 추가
              const DrawerHeader(
                // 헤더 영역의 중앙에 '오늘 우주는' 이라는 텍스트 추가
                decoration: BoxDecoration(color: Colors.black),
                // 헤더 영역의 중앙에 '오늘 우주는' 이라는 텍스트 추가
                child: Center(
                  child: Text(
                    '오늘 우주는',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              // ListTile 을 추가 한다
              ListTile(
                // 가장 앞에 (leading) 별 모양의 아이콘을 추가한다.
                leading: const Icon(Icons.star, color: Colors.white),
                // 아이콘 뒤에 '앱 평가하기' 라는 텍스트를 추가한다.
                title: const Text(
                  '앱 평가하기',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                // 클릭시 플레이스토어 실행 필요. (추후 추가 예정)
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
