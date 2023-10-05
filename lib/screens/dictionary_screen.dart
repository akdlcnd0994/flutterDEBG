import 'package:flutter/material.dart';

class DicionaryScreen extends StatelessWidget {
  const DicionaryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const MainDrawer(),
      // 상단 메뉴바, 제목, 검색관련 컨테이너
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.zero,
                color: Colors.teal[300],
                height: height * 0.35,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Column(
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
                                SizedBox(
                                  height: height * 0.023,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.22,
                            ),
                            Column(
                              children: [
                                const Text(
                                  '질환백과',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  'dictionary of diseases',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                )
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
                        textInputAction: TextInputAction.go,
                        onSubmitted: (value) {},
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          iconColor: Colors.white,
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          hintText: 'Type a keyword',
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
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: height * 0.055),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(24.0),
                                color: Colors.teal[500],
                                child: InkWell(
                                  splashColor: Colors.teal[200],
                                  borderRadius: BorderRadius.circular(24.0),
                                  onTap: () {
                                    print("ontap1");
                                  },
                                  child: SizedBox(
                                    height: height * 0.045,
                                    width: width * 0.45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "많이 찾는 질환",
                                          style: TextStyle(
                                              color: Colors.teal[50],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(24.0),
                                color: Colors.teal[700],
                                child: InkWell(
                                  splashColor: Colors.teal[200],
                                  borderRadius: BorderRadius.circular(24.0),
                                  onTap: () {
                                    print("ontap1");
                                  },
                                  child: SizedBox(
                                    height: height * 0.045,
                                    width: width * 0.45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "최근 검색 기록",
                                          style: TextStyle(
                                              color: Colors.teal[50],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 경계 아래 부분
              SizedBox(
                height: height * 0.56,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                      const Text("data"),
                      SizedBox(height: height * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// drawer
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          const ListTile(
            title: Text(
              "질환백과",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.personal_injury,
              color: Colors.black,
            ),
            title: const Text(
              '부위별 질환 찾기',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              print("부위별 질환 찾기");
            },
            trailing: const Icon(
              Icons.add,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text(
              'Setting',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              print('Setting is clicked');
            },
            trailing: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 565,
          ),
          const BottomAppBar(
            child: Text("by asan"),
          )
        ],
      ),
    );
  }
}
