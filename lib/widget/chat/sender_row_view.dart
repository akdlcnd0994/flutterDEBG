import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp/model/global_members.dart';
import 'package:medicalapp/screens/qna_screen.dart';

class SenderRowView extends StatelessWidget {
  const SenderRowView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
      ),
      visualDensity: VisualDensity.comfortable,
      title: Wrap(alignment: WrapAlignment.end, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 145, 144, 239),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(
            chatModelList.elementAt(index).message,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white),
            softWrap: true,
          ),
        ),
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 8, top: 4),
        child: Text(
          DateFormat('aa hh:mm').format(DateTime.now()),
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 10),
        ),
      ),
      trailing: CircleAvatar(
        backgroundImage: NetworkImage(myQuestionImg),
      ),
    );
  }
}
