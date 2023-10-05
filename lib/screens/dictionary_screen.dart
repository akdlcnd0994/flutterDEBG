import 'package:flutter/material.dart';
import 'package:medicalapp/widget/drawer.dart';

class DicionaryScreen extends StatelessWidget {
  const DicionaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const MainDrawer(),
      // 상단 메뉴바, 제목, 검색관련 컨테이너
      body: Container(
        padding: EdgeInsets.zero,
        color: Colors.teal[300],
        height: 280,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 140,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '질환백과',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'dictionary of diseases',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                // 검색 바
                Padding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      iconColor: Colors.white,
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      hintText: '검색',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [],
                ),
                const Row(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
