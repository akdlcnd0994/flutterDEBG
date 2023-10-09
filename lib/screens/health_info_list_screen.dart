import 'package:flutter/material.dart';

class HealthInfoListScreen extends StatelessWidget {
  String part;

  HealthInfoListScreen({required this.part, super.key});

  @override
  Widget build(BuildContext context) {
    choice();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(part),
        ),
        body: const Column(
          children: [],
        ));
  }

  void choice() {}
}
