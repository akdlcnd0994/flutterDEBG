import 'package:flutter/material.dart';
import 'package:medicalapp/http/dictionaryInfo.dart';
import 'package:medicalapp/model/diseaseModel.dart';

//ignore: must_be_immutable
class HealthInfoListScreen extends StatefulWidget {
  final String part;
  String keyword;

  HealthInfoListScreen(this.part, this.keyword, {super.key});

  @override
  State<HealthInfoListScreen> createState() => _HealthInfoListScreenState();
}

class _HealthInfoListScreenState extends State<HealthInfoListScreen> {
  int page = 0;

  List<String> list = [];

  late List<Widget> lw;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; // 화면의 높이
    double width = MediaQuery.of(context).size.width; // 화면의 가로

    if (widget.part != '') {
      choice();
    } else {
      search();
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.part),
        ),
        body: ListView(
          children: lw = pageList(context, height, width),
        ));
  }

  List<Widget> pageList(BuildContext context, double height, double width) {
    int temp = list.length;
    print(temp);
    temp = temp ~/ 15;

    return <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              for (int i = page * 15;
                  i < list.length && i < (page * 15) + 15;
                  i++)
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
                        DictionaryInfo().sendDataToJSP(context, list[i]);
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
                                list[i],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (page > 0)
                TextButton(
                  child: const Text('<<'),
                  onPressed: () {
                    page -= 1;
                    lw = pageList(context, height, width);
                    setState(() {});
                  },
                )
              else
                TextButton(
                  child: const Text(''),
                  onPressed: () {},
                ),
              const SizedBox(width: 20),
              Text((page + 1).toString()),
              const SizedBox(width: 20),
              if (page < temp)
                TextButton(
                  child: const Text('>>'),
                  onPressed: () {
                    page += 1;
                    lw = pageList(context, height, width);
                    setState(() {});
                  },
                )
              else
                TextButton(
                  child: const Text(''),
                  onPressed: () {},
                )
            ],
          ),
        ],
      ),
    ];
  }

  void search() {
    // all에 포함되어있는 것만 찾아내서 list에 추가
    widget.keyword = widget.keyword.toLowerCase();
    for (String str in all) {
      String t = str.toLowerCase();
      if (t.contains(widget.keyword)) {
        list.add(str);
      }
    }
    list = list.toSet().toList();
  }

  void choice() {
    if (widget.part == "가슴") {
      list = chest;
    } else if (widget.part == "골반") {
      list = pelvis;
    } else if (widget.part == "귀") {
      list = ear;
    } else if (widget.part == "기타") {
      list = etc;
    } else if (widget.part == "눈") {
      list = eye;
    } else if (widget.part == "다리") {
      list = leg;
    } else if (widget.part == "등/허리") {
      list = waist;
    } else if (widget.part == "머리") {
      list = head;
    } else if (widget.part == "목") {
      list = neck;
    } else if (widget.part == "발") {
      list = foot;
    } else if (widget.part == "배") {
      list = stomach;
    } else if (widget.part == "생식기") {
      list = organs;
    } else if (widget.part == "손") {
      list = hand;
    } else if (widget.part == "얼굴") {
      list = face;
    } else if (widget.part == "엉덩이") {
      list = hip;
    } else if (widget.part == "유방") {
      list = breast;
    } else if (widget.part == "입") {
      list = mouth;
    } else if (widget.part == "전신") {
      list = body;
    } else if (widget.part == "코") {
      list = nose;
    } else if (widget.part == "팔") {
      list = arm;
    } else if (widget.part == "피부") {
      list = skin;
    }
  }
}
