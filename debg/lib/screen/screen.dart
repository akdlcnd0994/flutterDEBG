import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/healthInfo.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("동의보감", style: TextStyle(fontSize: 24)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black, width: 3.0),
                    bottom: BorderSide(color: Colors.black, width: 3.0)),
              ),
              child: const Center(
                child: Text(
                  "로그인이 필요합니다",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          SizedBox(
            height: 250,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black, width: 3.0),
                    bottom: BorderSide(color: Colors.black, width: 3.0)),
              ),
              child: const Center(
                child: Text(
                  "로그인을 통해 문진을 진행해주세요.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          SizedBox(
            height: 80,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black, width: 3.0),
                    bottom: BorderSide(color: Colors.black, width: 3.0)),
              ),
              child: const Center(
                child: Text(
                  "자주 찾는 질병정보",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: '건강정보',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: '문진',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: '질문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내정보',
          ),
        ],
        selectedIconTheme:
            const IconThemeData(color: Colors.black), // 선택된 아이콘 스타일
        unselectedIconTheme:
            const IconThemeData(color: Colors.grey), // 선택되지 않은 아이콘 스타일
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ), // 선택된 라벨 스타일
        unselectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold), // 선택되지 않은 라벨 스타일
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => healthInfo(),
            ),
          );
        }
      },
    );
  }
}
