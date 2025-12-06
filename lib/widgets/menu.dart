import 'package:flutter/material.dart';

const greyColor = 0xff8C8C8C;

Container buildMenu([String? status]) {
  return Container(
    height: 90,
    decoration: BoxDecoration(color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, color: Color(greyColor), size: 40),
            Text('지도', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ]
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bookmark, color: Color(greyColor), size: 40),
            Text('저장된 경로', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ]
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit_square, color: Color(greyColor), size: 40),
            Text('게시판', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ]
        ),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: Color(greyColor), size: 40),
            Text('프로필', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ]
        ),
      ]
    )
  );
}