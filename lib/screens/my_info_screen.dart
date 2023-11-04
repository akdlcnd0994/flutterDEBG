import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicalapp/screens/profile.dart';
import 'package:provider/provider.dart';
import 'package:medicalapp/image/image_provider.dart' as MyAppImageProvider;
import 'package:medicalapp/http/result_list.dart';

class MyInfoScreen extends StatefulWidget {
  MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final _auth = FirebaseAuth.instance;
  late bool isLogin = false;
  late User loggedInUser;
  late String email;
  String name = '용가리'; //임시 닉네임
  List<String> result = [];
  bool check = true;

  void initState() {
    getCurrentUser();
    Future.delayed(Duration.zero, () {
      show_result();
    });
    super.initState();
  }

  Future<void> show_result() async {
    result = await resultList().sendDataToJSP(name);
    //print(text);

    if (result.isEmpty) {
      check = false;
    } else {
      for (int i = 0; i < 4; i++) {
        //parts[i] = text.substring(text.indexOf('§'));
        //print("$i = ");
        //print(parts[i]);
      }
    }
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        isLogin = true;
        email = loggedInUser.email!;
      } else {
        isLogin = false;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; // 화

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 58, 56, 56),
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          titleSpacing: 10,
          backgroundColor: const Color.fromARGB(255, 112, 112, 112),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          leadingWidth: 10,
          title: ListTile(
            title: Text(
              isLogin ? "${loggedInUser.email?.split("@")[0]}" : "Login",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
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
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyAppImageProvider.ImageProvider>(
              create: (context) => MyAppImageProvider.ImageProvider(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLogin
                        ? profile(loggedInUser: loggedInUser)
                        : Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  isLogin
                      ? "ID : ${loggedInUser.email?.split("@")[0]}"
                      : "ID : default",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  isLogin ? "의심 증상" : "로그인이 필요합니다.",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    height: height * 0.35,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 7),
                        )
                      ],
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoList,
                    )),
              ],
            ),
          ),
        ));
  }

  List<Widget> get infoList {
    String info;
    int i = 0;
    return [
      for (info in result)
        Text(
          "$info",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        )
    ];
  }
}
