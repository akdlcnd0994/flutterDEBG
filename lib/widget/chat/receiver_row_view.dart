import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicalapp/model/global_members.dart';
import 'package:medicalapp/screens/qna_screen.dart';
import 'package:http/http.dart' as http;

const apiKey = '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';
const apiUrl = 'https://api.openai.com/v1/completions';

class ReceiverRowView extends StatelessWidget {
  const ReceiverRowView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
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
      subtitle: const Padding(
        padding: EdgeInsets.only(left: 8, top: 4),
        child: Text('8:04 AM', style: TextStyle(fontSize: 10)),
      ),
    );
  }
}

Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );

  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}

class ResultPage extends StatefulWidget {
  final String prompt;
  const ResultPage(this.prompt, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result from GPT"),
      ),
      // body: Text(widget.prompt),
      body: FutureBuilder<String>(
        future: generateText(widget.prompt),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('${snapshot.data}');
          }
        },
      ),
    );
  }
}
