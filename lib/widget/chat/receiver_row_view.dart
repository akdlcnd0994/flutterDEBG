import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp/model/global_members.dart';
import 'package:medicalapp/screens/qna_screen.dart';

class ReceiverRowView extends StatelessWidget {
  const ReceiverRowView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          backgroundImage: NetworkImage(chatBotImg),
        ),
      ),
      title: Wrap(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text(
            chatModelList.elementAt(index).message,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ]),
      trailing: Container(
        width: 50,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8, top: 4),
        child: Text(DateFormat('aa hh:mm').format(DateTime.now()),
            style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
