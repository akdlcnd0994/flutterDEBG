import 'package:flutter/material.dart';

class result_list extends StatefulWidget {
  final List<String> data;

  const result_list({Key? key, required this.data}) : super(key: key);

  @override
  State<result_list> createState() => _result_listState();
}

class _result_listState extends State<result_list> {
  @override
  Widget build(BuildContext context) {
    // widget.data를 사용하여 temp 데이터를 화면에 표시하거나 처리
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.data[index]),
        );
      },
    );
  }
}
