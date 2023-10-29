import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/screens/login/login_screen.dart';
import 'package:medicalapp/widget/navigation_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
      },
      theme: ThemeData(
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: const NavigationScreen(),
      debugShowCheckedModeBanner: false,

      WidgetsFlutterBinding.ensureInitialized();
      return MaterialApp(
        routes: const {
          //'/login': (context) => LoginScreen();
        },
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.black),
          ),
        ),
        home: NavigationScreen(),
        debugShowCheckedModeBanner: false,

    );
  }
}
