import 'package:flutter/material.dart';
import '../widgets/header.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;
const lightGreenColor = 0xffE7F5E4;
const greenColor = 0xff51D32D;

class storedPage extends StatelessWidget {

    final header = buildHeader('서천마을');
    final contentArea = buildContentArea('이순신', '2024년 7월 15일', '“도심 속 숲길이 있는 동네에서 살고 싶다”는 꿈, 누구나 한 번쯤 꾸죠. 서천마을은 그 바람을 현실로 만들어주는 곳입니다. 도심과 가깝지만, 내부에는 자연과 쉼터가 조화롭게 어우러져 있죠. 도시의 편리함과 녹색 여유가 함께 있는 주거지, 바로 이곳입니다. 출퇴근은 편하고, 주말엔 산책로와 공원이 기다립니다. 도시와 자연의 균형을 찾는다면, 서천마을이 그 해답입니다.');
    final commentArea = buildCommentArea(12);

    @override
    Widget build(BuildContext context) {

      return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(lightGreenColor),
          body: SafeArea(
            child: Column(
              children: [
                header,
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(lightGreenColor),
                      ),
                      child: Column(
                        children: [
                          contentArea,
                          commentArea,
                        ]
                      )
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(lightGreyColor)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '댓글을 남기세요..',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                              ),
                            ),
                          ),
                        ), 
                      ),
                      GestureDetector(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(greenColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_upward, color: Colors.white, size: 30),
                          ),
                        )
                      )
                    ]
                  )
                ),
              ]
            )
          )
        )
      );
    }
}

Container buildContentArea(String name, String date, String content) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    padding: EdgeInsets.symmetric(vertical: 20),
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(lightGreenColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Icon(Icons.person, color: Color(greenColor), size: 40),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    child: Text(date, style: TextStyle(color: Color(greyColor), fontSize: 15, fontWeight: FontWeight.w500)),
                  )
                ]
              )
            ]
          )
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20),
          height: 250,
          decoration: BoxDecoration(
            color: Color(greyColor),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(content, style: TextStyle(color: Color(greyColor), fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ]
    )
  );
}

Container buildCommentArea(int num) {

  final commentBlock1 = commentBlock('김유신', '서천마을은 정말 아름다운 동네이죠! 산책하기에 좋아요.');

  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Text('댓글', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)), 
              ),
              Container(
                child: Text(num.toString(), style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)), 
              ),
            ]
          )
        ),
        commentBlock1,
        commentBlock1,
        commentBlock1,
        commentBlock1,
      ]
    )
  );
}

Container commentBlock(String name, String comment) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Color(lightGreenColor),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Icon(Icons.person, color: Color(greenColor), size: 40),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 5),
                child: Text(name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500))
              ),
              Container(
                child: Text(comment, style: TextStyle(color: Color(greyColor), fontSize: 15, fontWeight: FontWeight.w400)),
              )
            ]
          ), 
        ),
      ],
    )
  );
}