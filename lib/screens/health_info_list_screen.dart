import 'package:flutter/material.dart';
import 'package:medicalapp/model/diseaseModel.dart';

class HealthInfoListScreen extends StatelessWidget {
  String part;
  List<String> list = [];
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

  void choice() {
    if (part == "가슴") {
      list = chest;
    }
  }
}
