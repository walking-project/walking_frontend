import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/input.dart';
import '../widgets/menu.dart';

main() => runApp(storedPage());

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class storedPage extends StatelessWidget {

    final header = buildHeader('저장된 경로');
    final menu = buildMenu();
    final input = buildInput('경로 검색', 60, double.infinity);
    final modal1 = buildModal('서천마을');
    final modal2 = buildModal('서천마을', '거리: 3.2km');

    @override
    Widget build(BuildContext context) {
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
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Column(
                        children: [
                          input,
                          modal1,
                          modal1,
                          modal2,
                        ]
                      )
                    ),
                  )
                ),
                menu
              ]
            ),
          )
        )
      );
    }
}

GestureDetector buildModal(String title, [String? info, String? imageUrl]) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Color(lightGreyColor),
              borderRadius: BorderRadius.circular(15),
            )
          ),
          Column(
            children: [
              Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
              if(info != null) Text(info, style: TextStyle(color: Color(greyColor), fontSize: 16, fontWeight: FontWeight.w400)),
            ]
          )
        ]
      )
    )
  );
}