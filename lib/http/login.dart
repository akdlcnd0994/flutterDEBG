import 'package:medicalapp/http/ip.dart';
import 'package:http/http.dart' as http;

class Login {
  var url = Uri.parse(
      "${"http://${IP().getIp()}"}:8080/capstoneServer/webapp/db.jsp");

  Map<String, String> headers = {
    'Content-Type': 'applicaiton/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  Future<void> sendDataToJSP(
    // 호출 시 데이터
    String id,
    String pw,
  ) async {
    var response = await http.post(
      url,
      body: {
        'id': id,
        'pw': pw,
      }, // 전송할 데이터를 key-value 형태로 입력해주세요
    );

    if (response.statusCode == 200) {
      // 전송 성공 시 처리할 내용을 작성해주세요
      List<String> temp = response.body.split("\n");
      for (var t in temp) {
        print(t); // "로그인 성공!" + name(변수) 형태 (!를 기준으로 split해서 하면됨)
      }
    } else {
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
