import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/infoDetail.dart';

class healthInfo extends StatefulWidget {
  const healthInfo({super.key});

  @override
  State<healthInfo> createState() => _healthInfoState();
}

class _healthInfoState extends State<healthInfo> {
  int num = 0;

  final List<String> tName = [
    "가슴",
    "골반",
    "귀",
    "기타",
    "눈",
    "다리",
    "등/허리",
    "머리",
    "목",
    "발",
    "배",
    "생식기",
    "손",
    "얼굴",
    "엉덩이",
    "유방",
    "입",
    "전신",
    "코",
    "팔",
    "피부"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.shade200,
        appBar: AppBar(
          title: const Text('건강정보'),
          actions: const [
            Icon(Icons.search),
          ],
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          padding: const EdgeInsets.all(20),
          mainAxisSpacing: 20,
          crossAxisSpacing: 30,
          children: _GridTitleList(tName.length),
        ));
  }

  List<InkWell> _GridTitleList(int count) => List.generate(
        count,
        (index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const infoDetail()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.green.shade300,
                width: 3,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              tName[num++],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  // void _detailPage() {
  //   setState(() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const infoDetail(),
  //       ),
  //     );
  //   });
  // }
}
