import 'package:flutter/material.dart';
import 'package:medicalapp/widget/navigation.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
