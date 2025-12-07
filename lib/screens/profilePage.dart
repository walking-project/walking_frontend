import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../contexts/userContext.dart';
import '../utils/getProfileInfo.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class ProfileController extends GetxController {
  var username = ''.obs;
  var userid = ''.obs;

  setUserName(String val) => username.value = val;
  setUserId(String val) => userid.value = val;

  @override
  void onInit() async {
    super.onInit();
    print('onInit');
    final pref = await SharedPreferences.getInstance();
    final userController = await Get.find<Controller>();
    final token = await pref.getString('accessToken');
    final response = await getProfileInfo(token as String, userController.id.value);
    print(response);
    setUserName(response[0]['username']);
    setUserId(response[0]['userid']);
  }
}

class ProfilePage extends StatelessWidget {

    final header = buildHeader('프로필');
    final menu = buildMenu();
    final pController = Get.put(ProfileController());

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
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Color(greyColor),
                                borderRadius: BorderRadius.circular(75),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 40),
                              child: Obx(() => Column(
                                children: [
                                  Text(pController.username.value, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                                  Text(pController.username.value, style: TextStyle(color: Color(greyColor), fontSize: 16, fontWeight: FontWeight.w400)),
                                ]
                              ))
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('개인 설정', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600,), textAlign: TextAlign.left,), 
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('계정 정보', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('알림 설정', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  )
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('앱 정보', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600), textAlign: TextAlign.left),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('버전 정보', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('이용 약관', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('개인정보 처리방침', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  )
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text('도움말 및 지원', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600), textAlign: TextAlign.left),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('FAQ', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(lightGreyColor)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('문의하기', style: TextStyle(color: Color(greyColor), fontSize: 20, fontWeight: FontWeight.w400)),
                                  )
                                ]
                              )
                            )
                          ]
                        )
                      ),
                    ),
                  ),
                ),
                menu,
              ],
            )
          ),
        )
      );
    }
}