import 'package:bard_api/bard_api.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp/model/ChatMessagesModel.dart';
import 'package:medicalapp/model/global_members.dart';
import 'package:medicalapp/widget/chat/receiver_row_view.dart';
import 'package:medicalapp/widget/chat/sender_row_view.dart';

// chatbotimg
var chatBotImg =
    'https://github.com/jongwon-kr/flutterDEBG/blob/main/lib/assets/chatbot.png?raw=true';
var myQuestionImg =
    'https://github.com/jongwon-kr/flutterDEBG/blob/main/lib/assets/yellow%20question%20mark.png?raw=true';

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
        toolbarHeight: 40,
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.blue[300],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        leadingWidth: 10,
        title: ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(chatBotImg),
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
                  onTap: () async {
                    final bard = ChatBot(
                        sessionId:
                            "bwjGxmcF-HqxN5N4ELL3gR9BM-qLsqfYcCaVvorhNstMksOb8y1CS2rtNHAhaiMzXqBoDw.");
                    final result = bard.ask("Hello?");
                    print(result);
                    setState(() {
                      chatModelList.add(ChatModel(controller.text, true));
                      animateList();
                      controller.clear();

                      //controller.text를 함수로 보내고 값을 돌려받은 뒤 onLongPress의 함수로 보내기
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
