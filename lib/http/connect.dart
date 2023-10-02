import 'package:medicalapp/http/ip.dart';
import 'package:http/http.dart' as http;

class Register {
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
      String nick,
      String spn,
      String ans) async {
    var response = await http.post(
      url,
      body: {
        'id': id,
        'pw': pw,
        'nick': nick,
        'spn': spn,
        'ans': ans,
      }, // 전송할 데이터를 key-value 형태로 입력해주세요
    );

    if (response.statusCode == 200) {
      // 전송 성공 시 처리할 내용을 작성해주세요
      List<String> temp = response.body.split("\n");
      for (var t in temp) {
        print(t); //회원 가입 성공 !이면 회원가입성공 | 이미 존재하는 아이디 입니다. 일 경우 실패 메시지이므로
        // 들어온 메시지를 그대로 출력해주면 됨
      }
    } else {
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
