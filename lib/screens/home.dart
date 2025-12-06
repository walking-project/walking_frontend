import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';

main() => runApp(Home());

class Home extends StatelessWidget {
  
  final titleLogo = _buildLogo();
  final idInput = buildInput('아이디');
  final passwordInput = buildInput('비밀번호');
  final loginBtn = buildButton('로그인');
  final signUpBtn = buildButton('회원가입', () => Get.toNamed('/signup'));
  
  @override
  Widget build(BuildContext context) {
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
              fontSize: 40,
              fontWeight: FontWeight.w800,
            )
          ),
          Text(
            '당신의 산책 파트너',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            )
          ),
        ]
      )
  );
}