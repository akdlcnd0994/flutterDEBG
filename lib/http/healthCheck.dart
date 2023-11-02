import 'package:medicalapp/http/ip.dart';
import 'package:http/http.dart' as http;

class HealthCheck {
  var url = Uri.parse(
      "${"http://${IP().getIp()}"}:8080/capstoneServer/webapp/quedb.jsp");

  Map<String, String> headers = {
    'Content-Type': 'applicaiton/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  Future<void> sendDataToJSP(String name, String result) async {
    var response = await http.post(
      url,
      body: {
        'NM': name,
        'RT': result,
      },
      // 이름과 질병명 리스트를 보냄
    );

    if (response.statusCode == 200) {
      print("성공");
      String t = response.body;
      List<String> temp = t.split("§");

      print("info = $temp");
    } else {
      List<String> fail = ['fail_data'];
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
