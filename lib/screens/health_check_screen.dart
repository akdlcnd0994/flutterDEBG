import 'package:flutter/material.dart';
import 'package:medicalapp/http/healthCheck.dart';
import 'package:medicalapp/screens/my_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class healthCheckScreen extends StatefulWidget {
  const healthCheckScreen({super.key});

  @override
  State<healthCheckScreen> createState() => _healthCheckScreenState();
}

class _healthCheckScreenState extends State<healthCheckScreen> {
  List<String> que = [
    "통증",
    "두통",
    "복통",
    "요통",
    "흉통",
    "기침",
    "관절통",
    "근육통",
    "통풍",
    "생리통",
    "인후통",
    "신경통",
    "관절염",
    "협심증",
    "월경통",
    "배뇨통",
    "빈뇨",
    "소화불량",
    "호흡곤란",
    "변비",
    "설사",
    "구토",
    "체중감소",
    "피로감",
    "발열",
    "오심",
    "두근거림",
    "당뇨",
    "고혈압",
    "빈혈",
    "천식",
    "부비동",
    "코",
    "어깨",
    "목",
    "팔",
    "손",
    "다리",
    "눈",
    "골반"
  ];
  static List<bool> responses = [];
  int check = 0;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late bool isLogin = false;
  late User loggedInUser;
  late int point = 0;

  late final userPoint = <String, dynamic>{
    "point": point,
  };

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
    responses = List.filled(que.length, false);
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        _firestore
            .collection("mileages")
            .doc(loggedInUser.email)
            .get()
            .then((value) => userPoint["point"] = value.data()?["point"]);
        isLogin = true;
      } else {
        isLogin = false;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.teal[400],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: const ListTile(
          title: Text(
            '문진',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.savings,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                for (int i = 0; i < que.length; i++) buildQuestion(i, que[i]),
                IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 40,
                    ),
                    onPressed: () {
                      validateAndSubmit();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(int index, String question) {
    return Column(
      children: [
        if (index <= 30)
          Text(
            "${index + 1}. $question 이/가 있습니까?",
            style: const TextStyle(fontSize: 18),
          ),
        if (index > 30)
          Text(
            "${index + 1}. $question 에 통증이 있습니까?",
            style: const TextStyle(fontSize: 18),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: true,
              groupValue: responses[index],
              onChanged: (value) {
                setState(() {
                  responses[index] = true;
                });
              },
            ),
            const Text("Y"),
            Radio(
              value: false,
              groupValue: responses[index],
              onChanged: (value) {
                setState(() {
                  responses[index] = false;
                });
              },
            ),
            const Text("N"),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void validateAndSubmit() {
    String result = "";
    String name = '용가리';
    for (int i = 0; i < que.length; i++) {
      if (responses[i] == true) {
        result += "${que[i]},";
      }
    }
    if (result.split(",").length >= 4) {
      HealthCheck().sendDataToJSP(name, result);
      //마일리지 올리기
      userPoint["point"] += 500;
      print('check\n');
      print(userPoint["point"]);
      isLogin
          ? _firestore
              .collection("mileages")
              .doc(loggedInUser.email)
              .set(
                userPoint,
                SetOptions(merge: true),
              )
              .onError(
                (e, _) => print("Error:$e"),
              )
          : print("not login!");

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const MyInfoScreen()), // MyInfoScreen로 이동
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("증상을 3개 이상 선택해주세요"),
          );
        },
      );
    }
  }
}
