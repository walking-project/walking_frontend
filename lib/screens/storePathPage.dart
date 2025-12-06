import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';
import '../widgets/header.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class storePathPage extends StatelessWidget {

    final header = buildHeader('경로 저장하기');
    final cancelBtn = buildButton('취소');
    final confirmBtn = buildButton('확인');
    final nameInput = buildInput('경로 이름', 60, double.infinity);
    final descriptionInput = buildInput('경로 설명', 165, double.infinity);

    @override
    Widget build(BuildContext context) {

      return MaterialApp (
        title: '경로 저장하기',
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                header,
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Container (
                              height: 360,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(lightGreyColor),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            nameInput,
                            descriptionInput,
                            Container (
                              height: 360,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(lightGreyColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.cloud_upload, color: Color(greyColor), size: 80),
                                        Text('사진 업로드', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                                      ]
                                    )
                                  ),
                                )
                              ),
                            ),
                          ]
                        ),
                      ),
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 60,
                            margin: EdgeInsets.only(right: 15),
                            child: cancelBtn,
                          ),
                          Container(
                            width: 180,
                            height: 60,
                            child: confirmBtn,
                          ),
                        ]
                      )
                    ),
                  ),
              ]
            ),
          ),
        ),
      );
    }
}