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
    String info, //닉네임 또는 id
    String spn,
    String ans,
    String check, //0이면 id찾기 / 1이면 pw찾기
  ) async {
    var response = await http.post(
      url,
      body: {
        'info': info,
        'spn': spn,
        'ans': ans,
        'check': check,
      }, // 전송할 데이터를 key-value 형태로 입력해주세요
    );

    if (response.statusCode == 200) {
      // 전송 성공 시 처리할 내용을 작성해주세요
      print(response.body); //ID찾기면 (ID는 id입니다.)  | PW찾기면 (PW는 pw입니다.)
    } else {
      // 전송 실패 시 처리할 내용을 작성해주세요
      print('Failed to send data!');
    }
  }
}
