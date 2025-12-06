import 'package:get/get.dart';

class Controller extends GetxController {
  var id = ''.obs; // Observable 변수 선언, 전역 상태가 아닌 input값 설정하는 상태
  var nickname = ''.obs;
  var password = ''.obs;
  var accessToken = ''.obs;

  setId(String val) => id.value = val;
  setNickname(String val) => nickname.value = val;
  setPassword(String val) => password.value = val;
  setToken(String val) => accessToken.value = val;
}