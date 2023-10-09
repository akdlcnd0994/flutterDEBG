import 'package:flutter/material.dart';
import 'package:medicalapp/http/dictionaryInfo.dart';

List<String> diseases = <String>[
  "질환 1",
  "질환 2",
  "질환 3",
  "질환 4",
  "질환 5",
  "질환 6",
  "질환 7",
  "질환 8",
  "질환 9",
  "질환 10",
  "질환 11",
  "질환 12",
  "질환 13",
  "질환 14",
  "질환 15",
];

List<String> recentSearch = <String>[
  "최근 1",
  "최근 2",
  "최근 3",
  "최근 4",
  "최근 5",
  "최근 6",
  "최근 7",
  "최근 8",
  "최근 9",
  "최근 10",
  "최근 11",
  "최근 12",
  "최근 13",
  "최근 14",
  "최근 15",
];

List<String> parts = <String>[
  "가슴",
  "골반",
  "귀",
  "기타",
  "눈",
  "다리",
  "등/허리",
  "머리",
  "목",
  "발",
  "배",
  "생식기",
  "손",
  "얼굴",
  "엉덩이",
  "유방",
  "입",
  "전신",
  "코",
  "팔",
  "피부"
];

class DicionaryScreen extends StatelessWidget {
  const DicionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    List<String> pokeywords = <String>[];
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const MainDrawer(),
      // 상단 메뉴바, 제목, 검색관련 컨테이너
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.teal[500],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.zero,
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
                                  height: height * 0.02,
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
                        SizedBox(height: height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                    print("많이 찾는 질환");
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
                                color: Colors.teal[900],
                                child: InkWell(
                                  splashColor: Colors.teal[200],
                                  borderRadius: BorderRadius.circular(24.0),
                                  onTap: () {
                                    print("최근 검색 기록");
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
              newMethod(context, height, width),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox newMethod(BuildContext context, height, double width) {
    return SizedBox(
      height: height * 0.65,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            for (String disease in diseases)
              poKeyword(context, disease, height, width),
            SizedBox(
              height: height * 0.095,
            )
          ],
        ),
      ),
    );
  }

  Container poKeyword(
      BuildContext context, String disease, double height, double width) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            DictionaryInfo().sendDataToJSP(context, disease);
          },
          child: SizedBox(
            height: height * 0.0545,
            width: width,
            child: Padding(
              padding: EdgeInsets.only(left: (width * 0.1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    disease,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
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
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const ListTile(
            title: Text(
              "부위별 질환 검색",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w800),
            ),
          ),
          for (String part in parts) drawerMenu(part),
        ],
      ),
    );
  }

  ListTile drawerMenu(String menuName) {
    return ListTile(
      shape: const Border(bottom: BorderSide(color: Colors.grey)),
      splashColor: Colors.teal[100],
      trailing: Icon(
        Icons.double_arrow,
        color: Colors.teal[100],
      ),
      title: Text(
        menuName,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onTap: () {
        print(menuName);
      },
    );
  }
}
