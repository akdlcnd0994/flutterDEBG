import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:medicalapp/screens/login/constants.dart';
import 'package:medicalapp/widget/navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email '),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password '),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              child: const Text('Log in'),
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                //Login to existing account
                try {
                  await _auth
                      .signInWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationScreen(),
                      ),
                    );
                    return value;
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('등록되지 않은 이메일입니다');
                  } else if (e.code == 'wrong-password') {
                    print('비밀번호가 틀렸습니다');
                  } else {
                    print(e.code);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
