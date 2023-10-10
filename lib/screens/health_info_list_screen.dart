import 'package:flutter/material.dart';
import 'package:medicalapp/http/dictionaryInfo.dart';
import 'package:medicalapp/model/diseaseModel.dart';

class HealthInfoListScreen extends StatelessWidget {
  final String part;
  List<String> list = [];
  HealthInfoListScreen(this.part, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로
    choice();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(part),
        ),
        body: ListView(
          children: <Widget>[
            for (String dis in list)
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4)),
                  ),
                ),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      DictionaryInfo().sendDataToJSP(context, dis);
                    },
                    child: SizedBox(
                      height: height * 0.0545,
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.only(left: (width * 0.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              dis,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ));
  }

  void choice() {
    if (part == "가슴") {
      list = chest;
    } else if (part == "골반") {
      list = pelvis;
    } else if (part == "귀") {
      list = ear;
    } else if (part == "기타") {
      list = etc;
    } else if (part == "눈") {
      list = eye;
    } else if (part == "다리") {
      list = leg;
    } else if (part == "등/허리") {
      list = waist;
    } else if (part == "머리") {
      list = head;
    } else if (part == "목") {
      list = neck;
    } else if (part == "발") {
      list = foot;
    } else if (part == "배") {
      list = stomach;
    } else if (part == "생식기") {
      list = organs;
    } else if (part == "손") {
      list = hand;
    } else if (part == "얼굴") {
      list = face;
    } else if (part == "엉덩이") {
      list = hip;
    } else if (part == "유방") {
      list = breast;
    } else if (part == "입") {
      list = mouth;
    } else if (part == "전신") {
      list = body;
    } else if (part == "코") {
      list = nose;
    } else if (part == "팔") {
      list = arm;
    } else if (part == "피부") {
      list = skin;
    }
  }
}
