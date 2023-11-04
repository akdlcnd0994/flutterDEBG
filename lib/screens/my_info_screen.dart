import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:medicalapp/image/image_provider.dart' as MyAppImageProvider;
import 'package:medicalapp/widget/result_list.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late bool isLogin = false;
  late User loggedInUser;
  late String email;
  List<String> tempData = [];

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
      } else {
        isLogin = false;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 56, 56),
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
              style: const TextStyle(
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLogin ? Y_Login(loggedInUser: loggedInUser) : const N_Login()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              isLogin
                  ? "ID : ${loggedInUser.email?.split("@")[0]}"
                  : "ID : default",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              isLogin ? "문진 결과" : "로그인이 필요합니다.",
              style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tempData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tempData[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class N_Login extends StatelessWidget {
  const N_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class Y_Login extends StatefulWidget {
  final User loggedInUser;
  const Y_Login({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  State<Y_Login> createState() => _Y_LoginState();
}

class _Y_LoginState extends State<Y_Login> {
  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 3;
    final imageProvider =
        Provider.of<MyAppImageProvider.ImageProvider>(context, listen: false);

    return Column(
      children: [
        Container(
          child: GestureDetector(
            onTap: () {
              _showBottomSheet();
            },
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 58, 56, 56),
              ),
              child: imageProvider.image != null // 이미지가 선택되었는지 확인
                  ? ClipOval(
                      child: Image.file(
                        File(imageProvider.image!.path), // 이미지를 표시합니다.
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: imageSize,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  _showBottomSheet() {
    final picker = ImagePicker();
    final imageProvider =
        Provider.of<MyAppImageProvider.ImageProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () async {
                final multiImage = await picker.pickMultiImage();
                if (multiImage.isNotEmpty) {
                  imageProvider.setImage(multiImage.first); // 첫 번째 이미지를 업데이트
                }
                setState(() {
                  imageProvider.image;
                });
                Navigator.pop(context); // 이미지를 선택한 후 바텀 시트를 닫습니다.
              },
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        );
      },
    );
  }
}
