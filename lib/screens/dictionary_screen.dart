import 'package:flutter/material.dart';

class DicionaryScreen extends StatelessWidget {
  const DicionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Container(
          padding: EdgeInsets.zero,
          // 상단 메뉴바, 제목, 검색관련 컨테이너
          child: Container(
            padding: EdgeInsets.zero,
            color: Colors.teal[300],
            height: 280,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                        ),
                        Column(
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                // 질환백과 사이드 메뉴바
                                IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    // 검색 바
                    Padding(
                      padding: EdgeInsets.all(
                        15,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          iconColor: Colors.white,
                          hintStyle: TextStyle(
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
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                    Row(),
                  ],
                ),
              ],
            ),
          ),
        ),,
    );
  }
}
