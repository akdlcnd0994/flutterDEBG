import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

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
            "${loggedInUser.email?.split("@")[0]}님 어서오세요",
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [],
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
                          child: quizSolve
                              ? quizAnswer(
                                  quizResult, height, quizs, selectQuiz)
                              : OXquiz(quizs, selectQuiz),
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
                  height: height * 0.15,
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
