import 'package:flutter/material.dart';

class HealthInfoScreen extends StatelessWidget {
  List<String> title = ["질환명", "정의", "원인", "증상", "진단", "치료", "경과", "주의사항"];
  var info = [];

  HealthInfoScreen(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(info[0])),
        body: Column(
          children: <Widget>[for (String a in info) Text(a)],
        ));
  }
}
