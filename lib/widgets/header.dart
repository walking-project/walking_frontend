import 'package:flutter/material.dart';

const lightGreyColor = 0xffD9D9D9;

Container buildHeader(String text) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(lightGreyColor))
        )
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Color(0xff404040), fontSize: 18, fontWeight: FontWeight.w700))
      )
    );
}