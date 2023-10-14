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
  late User loggedInUser;
  late String messageText;

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
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: const Color.fromARGB(255, 211, 218, 224),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: ListTile(
          title: Text(
            "${loggedInUser.email}님 어서오세요",
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
        color: const Color.fromARGB(255, 211, 218, 224),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.15,
                      width: width * 0.425,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.15,
                      width: width * 0.425,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )
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
}

class MessageBubble extends StatelessWidget {
  final String messageTxt;
  final String messageSender;
  final bool isMe;

  const MessageBubble(
      {Key? key,
      required this.messageTxt,
      required this.messageSender,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          messageSender,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                topLeft: isMe
                    ? const Radius.circular(30.0)
                    : const Radius.circular(0),
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
                topRight: isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageTxt,
                style: TextStyle(
                    color: isMe ? Colors.white : Colors.black54, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
