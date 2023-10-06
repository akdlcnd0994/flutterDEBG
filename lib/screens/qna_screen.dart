import 'package:flutter/material.dart';
import 'package:medicalapp/model/ChatMessagesModel.dart';
import 'package:medicalapp/model/global_members.dart';
import 'package:medicalapp/widget/chat/receiver_row_view.dart';
import 'package:medicalapp/widget/chat/sender_row_view.dart';

var url =
    'https://i.pinimg.com/736x/fd/6e/04/fd6e04548095d7f767917f344a904ff1.jpg';
var urlTwo =
    'https://sguru.org/wp-content/uploads/2017/03/cute-n-stylish-boys-fb-dp-2016.jpg';

class QNAScreen extends StatefulWidget {
  const QNAScreen({Key? key}) : super(key: key);

  @override
  MyChatUIState createState() => MyChatUIState();
}

class MyChatUIState extends State<QNAScreen> {
  var controller = TextEditingController();
  var scrollController = ScrollController();
  var message = '';

  void animateList() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.offset !=
          scrollController.position.maxScrollExtent) {
        animateList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 244, 249),
      appBar: AppBar(
        elevation: 12,
        titleSpacing: 10,
        backgroundColor: Colors.blue[400],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
          title: const Text(
            'Q&A',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.question_mark_rounded),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext con) {
                      return AlertDialog(
                        title: const Text("ChatGPT를 연동한 Q&A"),
                        content: SingleChildScrollView(
                          child: Container(
                            child: const Text("xxxxxxxxxxxxxxxx"),
                          ),
                        ),
                      );
                    });
                print("question mark is clicked");
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: chatModelList.length,
              itemBuilder: (context, index) =>
                  chatModelList.elementAt(index).isMee
                      ? SenderRowView(
                          index: index,
                        )
                      : ReceiverRowView(index: index),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, left: 8),
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.blue[800],
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.blue[800],
                    maxLines: 6,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    onFieldSubmitted: (value) {
                      controller.text = value;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        focusColor: Colors.white,
                        hintText: 'Type a question',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12, right: 10),
                ),
                GestureDetector(
                  // send 버튼 한번 누르기
                  onTap: () {
                    setState(() {
                      chatModelList.add(ChatModel(controller.text, true));
                      animateList();
                      controller.clear();
                    });
                  },
                  // send 버튼 길게 누르기
                  onLongPress: () {
                    setState(() {
                      chatModelList.add(ChatModel(controller.text, false));
                      animateList();
                      controller.clear();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[800],
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
