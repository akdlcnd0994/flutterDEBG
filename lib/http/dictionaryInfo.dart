import 'package:flutter/material.dart';
import 'package:medicalapp/http/ip.dart';
import 'package:http/http.dart' as http;
import 'package:medicalapp/screens/health_info_screen.dart';

class DictionaryInfo {
  var url = Uri.parse(
      "${"http://${IP().getIp()}"}:8080/capstoneServer/webapp/health.jsp");

  Map<String, String> headers = {
    'Content-Type': 'applicaiton/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  void sendDataToJSP(BuildContext context, data) async {
    var response = await http.post(
      url,
      body: {'part': data}, // 전송할 데이터를 key-value 형태로 입력해주세요
    );

    if (response.statusCode == 200) {
      // 전송 성공 시 처리할 내용을 작성해주세요
      List<String> temp = response.body.split("\n");

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HealthInfoScreen(temp)));
    } else {
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
