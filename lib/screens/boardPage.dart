import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';
import '../widgets/input.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class storedPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

      final header = buildHeader('게시판');
      final menu = buildMenu();
      final input = buildInput('게시글 검색', 60, double.infinity);
      final boardModal1 = boardModal('서천마을', '이순신');

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
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        children: [
                          input,
                          boardModal1,
                          boardModal1,
                          boardModal1,
                          boardModal1,
                        ]
                      )
                    )
                  )
                ),
                menu
              ]
            )
          ),
        )
      );
    }
}

Container boardModal(String title, String name, [String? imageUrl]) {
  return Container(
    width: double.infinity,
    height: 160,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(20, 0, 0, 0),
          blurRadius: 8,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
            Text('작성자: $name', style: TextStyle(color: Color(greyColor), fontSize: 14, fontWeight: FontWeight.w500)),
          ]
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(greyColor),
          )
        ),
      ]
    )
  );
}