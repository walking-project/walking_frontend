import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walking_client/screens/signUpPage.dart';
import 'package:walking_client/screens/Home.dart';

main() => runApp(App());

// const greyColor = 0xff8C8C8C;
// const lightGreyColor = 0xffD9D9D9;
// const lightGreenColor = 0xffE7F5E4;
// const greenColor = 0xff51D32D;

class App extends StatelessWidget {
    const App({super.key});

    @override
    Widget build(BuildContext context) {

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => Home()),
          GetPage(name: '/signup', page: () => SignUpPage()),
        ],
      );
    }
}