import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/menu.dart';

const greyColor = 0xff8C8C8C;

class MapPage extends StatelessWidget {
    final menu = buildMenu();
    final startBtn = buildButton('경로 시작');
    final storeBtn = buildButton('경로 저장');

    @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final input = buildInput();

      return MaterialApp (
        title: '지도',
        home: Scaffold(
          body: Stack(
            children: [
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          input,
                        ]
                      )
                    )
                  ),
                  Positioned(
                    bottom: 170,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 332,
                        height: 60,
                        child: startBtn,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 332,
                        height: 60,
                        child: storeBtn,
                      ),
                    )
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: menu,
                  ),
                ],
              )
          )
        );
    }
}

Container buildInput() {
  return Container(
    margin: EdgeInsets.all(20),
    width: 362,
    height: 60,
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(227, 255, 255, 255),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.search, size: 24, color: Color(greyColor)), 
        ),
        Text('위치 검색', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ]
    ),
  );
}