import 'package:flutter/material.dart';

Container buildInput(String prop, [double? height, double? width, void Function(String)? onChanged]){
  final isSecure = (prop == '비밀번호') ? true : false;
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        width: 1,
        color: Color(0xffD1D1D1)
      ),
    ),
    width: width ?? 332,
    height: height ?? 60,
    child: TextField(
        onChanged: (text) {
          if(onChanged != null) onChanged(text);
        },
        obscureText: isSecure,
        decoration: InputDecoration(
          hintText: prop,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
          )
        )
      )
  );
}