import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../utils/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var id = ''.obs;
  var password = ''.obs;

  setId(String val) => id.value = val;
  setPassword(String val) => password.value = val;
}

class Home extends StatelessWidget {

  final LoginController controller = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    final titleLogo = _buildLogo();
    final idInput = buildInput('아이디', null, null, controller.setId);
    final passwordInput = buildInput('비밀번호', null, null, controller.setPassword);
    final loginBtn = buildButton('로그인', () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      final res = await login(controller.id.value, controller.password.value, token as String);
      if(!context.mounted) return;
      if(res == false) showAlert(context);
      else Get.toNamed('/map');
    });
    final signUpBtn = buildButton('회원가입', () => Get.toNamed('/signup'));

    return MaterialApp(
      title: '뚜벅뚜벅',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xffF7F8F6)
          ),
          padding: EdgeInsets.symmetric(
            vertical: 80, horizontal: 35),
          child: Center(
            child: Column(
              children: [
                titleLogo,
                idInput,
                passwordInput,
                loginBtn,
                SizedBox(height: 10),
                signUpBtn,
              ]
            )
          ) 
        )
      )
    ); 
  }
}

Container _buildLogo(){
  return Container(
    margin: EdgeInsets.only(bottom: 28),
    child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
             width: 150,
             height: 150,
            ),
          Text(
            '뚜벅뚜벅', 
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            )
          ),
          Text(
            '당신의 산책 파트너',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            )
          ),
        ]
      )
  );
}