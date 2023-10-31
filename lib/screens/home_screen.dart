import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:medicalapp/screens/login/chat_screen.dart';
import 'package:medicalapp/screens/login/welcome_screen.dart';
import 'package:medicalapp/widget/navigation_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "chat_screen";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late bool isLogin = false;
  late User loggedInUser;
  late String messageText;
  late String email;
  late int point = 0;
  bool quizSolve = false;
  late bool quizResult;
  late final userPoint = <String, dynamic>{
    "email": email,
    "point": point,
  };

  Future signOut() async {
    try {
      print('sign out complete');
      return await _auth.signOut();
    } catch (e) {
      print('sign out failed');
      print(e.toString());
      return null;
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        isLogin = true;
        email = loggedInUser.email!;
        _firestore
            .collection("mileages")
            .doc(loggedInUser.email)
            .get()
            .then((value) => userPoint["point"] = value.data()?["point"]);
      } else {
        isLogin = false;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    int selectQuiz = Random().nextInt(14);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: const Color.fromARGB(255, 189, 219, 244),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: ListTile(
          title: Text(
            isLogin ? "${loggedInUser.email?.split("@")[0]}님 어서오세요" : "Hello!!",
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              //Dialog Main Title
                              title: const Column(
                                children: <Widget>[
                                  Text("Logout"),
                                ],
                              ),
                              //
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "로그아웃 하시겠습니까?",
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        "예",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.teal[400],
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          signOut();
                                          isLogin = false;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "아니오",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.teal[400],
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 24,
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 210, 229, 245),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                StreamBuilder(
                    stream: _firestore
                        .collection('quiz')
                        .orderBy('id', descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        final quiz = snapshot.data?.docs;
                        List<DailyQuiz> quizs = [];
                        for (var q in quiz!) {
                          final id = (q.data())['id'];
                          final quiz = (q.data())['quiz'];
                          final answer = (q.data())['answer'];
                          final comment = (q.data())['comment'];
                          quizs.add(
                            DailyQuiz(
                              id: id,
                              quiz: quiz,
                              answer: answer,
                              comment: comment,
                              isLogin: isLogin,
                            ),
                          );
                        }
                        return Container(
                          padding: const EdgeInsets.all(10),
                          width: width * 0.90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: isLogin
                              ? quizSolve
                                  ? quizAnswer(
                                      quizResult, height, quizs, selectQuiz)
                                  : OXquiz(quizs, selectQuiz)
                              : loginColumn(
                                  height: height,
                                  width: width,
                                  isLogin: isLogin,
                                ),
                        );
                      }
                    }),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.15,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text("문진"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.15,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text("아두이노 일일검진"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.15,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text("OX퀴즈"),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // 채팅창 이동
                  child: Column(
                    children: [
                      Container(
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                          child: InkWell(
                            splashColor: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                            onTap: () {
                              isLogin
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ChatScreen(),
                                      ),
                                    )
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomeScreen(),
                                      ),
                                    );
                            },
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    isLogin ? "채팅방으로 이동하기" : "로그인 후 이용가능합니다.",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    isLogin ? "" : "회원 채팅방",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  SizedBox(
                                    height: !isLogin ? height * 0.01 : 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: height * 0.30,
                  width: width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column quizAnswer(quizResult, height, quizs, selectQuiz) {
    return Column(
      children: [
        SizedBox(
          height: quizResult ? null : height * 0.01,
        ),
        Text(
          quizResult ? "정답입니다!" : "오답입니다..",
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          quizResult ? "" : "Fact",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: quizResult ? null : height * 0.01,
        ),
        Text(quizResult
            ? "100point가 적립되었습니다!"
            : quizs.elementAt(selectQuiz).comment),
        SizedBox(
          height: height * 0.01,
        ),
        IconButton(
          onPressed: () {
            quizSolve = false;
            print(quizSolve);
            setState(() {});
          },
          icon: Icon(
            Icons.check,
            color: Colors.teal[800],
          ),
          iconSize: 40,
        ),
      ],
    );
  }

  Column OXquiz(List<DailyQuiz> quizs, int selectQuiz) {
    return Column(
      children: [
        Text(
          "OX 퀴즈",
          style: TextStyle(
              color: Colors.teal[800],
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        quizs.elementAt(selectQuiz),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                if (quizs.elementAt(selectQuiz).answer == "O") {
                  print("correct");
                  quizResult = true;
                  userPoint["point"] += 100;

                  _firestore
                      .collection("mileages")
                      .doc(loggedInUser.email)
                      .set(
                        userPoint,
                        SetOptions(merge: true),
                      )
                      .onError(
                        (e, _) => print("Error:$e"),
                      );
                } else {
                  quizResult = false;
                  print("wrong");
                }
                setState(() {
                  quizSolve = true;
                });
              },
              icon: const Icon(Icons.circle_outlined),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                if (quizs.elementAt(selectQuiz).answer == "X") {
                  quizResult = true;
                  print("correct");
                  userPoint["point"] += 100;

                  _firestore
                      .collection("mileages")
                      .doc(loggedInUser.email)
                      .set(
                        userPoint,
                        SetOptions(merge: true),
                      )
                      .onError(
                        (e, _) => print("Error:$e"),
                      );
                } else {
                  quizResult = false;
                  print("wrong");
                }
                setState(() {
                  quizSolve = true;
                });
              },
              icon: const Icon(Icons.close),
              iconSize: 40,
            ),
          ],
        ),
      ],
    );
  }
}

class loginColumn extends StatelessWidget {
  const loginColumn({
    super.key,
    required this.height,
    required this.width,
    required this.isLogin,
  });

  final double height;
  final double width;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0), color: Colors.white),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
            child: InkWell(
              splashColor: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "로그인 후 이용가능합니다.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "클릭 시 로그인으로 이동합니다",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: !isLogin ? height * 0.01 : 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DailyQuiz extends StatelessWidget {
  final int id;
  final String quiz;
  final String answer;
  final String comment;
  final bool isLogin;

  const DailyQuiz(
      {Key? key,
      required this.isLogin,
      required this.id,
      required this.quiz,
      required this.answer,
      required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Q. $quiz",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
