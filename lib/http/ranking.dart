import 'package:medicalapp/http/ip.dart';
import 'package:http/http.dart' as http;

class Duration {
  var url = Uri.parse(
      "${"http://${IP().getIp()}"}:8080/capstoneServer/webapp/ranking.jsp");

  Map<String, String> headers = {
    'Content-Type': 'applicaiton/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  Future<void> sendDataToJSP() async {
    var response = await http.post(
      url,
      body: {'start': "start"}, // diseaseName = 질병명임 | 질병명을 보내서 duration값을 1올림
    );

    if (response.statusCode == 200) {
      List<String> temp = response.body.split("\n");
      for (var t in temp) {
        print(t); //랭킹순서대로 들어오므로 하나씩 처리 ( 최대 10개 )
      }
    } else {
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
