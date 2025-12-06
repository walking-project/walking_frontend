import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../utils/postUserInfo.dart';
import '../contexts/userContext.dart';
import 'package:shared_preferences/shared_preferences.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;
const lightGreenColor = 0xffE7F5E4;
const greenColor = 0xff51D32D;

class SignUpPage extends StatelessWidget {
    
    final Controller controller = Get.put(Controller());

    @override
    Widget build(BuildContext context) {
      final header = buildHeader('회원가입');
      final nicknameForm = buildForm('닉네임', controller.setNickname);
      final idForm = buildForm('아이디', controller.setId);
      final passwordForm = buildForm('비밀번호', controller.setPassword);
      final confirmButton = buildButton('회원가입', () async{
        final token = await postUserInfo(controller.id.value, controller.nickname.value, controller.password.value);
        print('response token: $token');
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', token);
        controller.setToken(token);
        Get.toNamed('/');
        // print(controller.accessToken.value);
      }); // 함수를 실행된 상태로 넘기면 안됨

      final test = buildTest(controller.id, controller.nickname, controller.password);

      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                header,
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                      child: Column(
                        children: [
                          nicknameForm,
                          idForm,
                          passwordForm,
                          SizedBox(
                            height: 30,
                          ),
                          confirmButton,
                        ]
                      )
                    ),
                  ),
                ),
              ]
            )
          ),
        )
      );
    }
}

Container buildForm(String text, [dynamic onChanged]) {
  final input = buildInput(text, null, null, onChanged);

  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 13),
          margin: EdgeInsets.only(bottom: 10),
          child: Text(text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        ),
        input,
      ],
    ),
  );
}

Obx buildTest(RxString id, RxString nickname, RxString password) {
  return Obx( // 변수를 구독하기 위해서는 Obx 위젯을 사용하여야 함
    () => Row(
      children: [
        Text(id.value, style: TextStyle(color: Colors.black)),
        Text(nickname.value, style: TextStyle(color: Colors.black)),
        Text(password.value, style: TextStyle(color: Colors.black)),
      ]
    )
  );
}