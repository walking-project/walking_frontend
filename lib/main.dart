import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walking_client/screens/signUpPage.dart';
import 'package:walking_client/screens/Home.dart';
import 'package:walking_client/screens/mapPage.dart';
import 'package:walking_client/screens/storedPage.dart';
import 'package:walking_client/screens/boardPage.dart';
import 'package:walking_client/screens/profilePage.dart';
import 'package:walking_client/contexts/colorContext.dart';
import 'package:walking_client/screens/writeBoardPage.dart';
import 'package:walking_client/screens/storePathPage.dart';
import 'package:walking_client/screens/boardDetailPage.dart';
import './contexts/userContext.dart';

main() async {
  Get.put(menuController(), permanent: true);
  Get.put(Controller(), permanent: true);
  runApp(App());
}

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
          GetPage(name: '/map', page: () => MapPage()),
          GetPage(name: '/stored', page: () => StoredPage()),
          GetPage(name: '/board', page: () => BoardPage()),
          GetPage(name: '/profile', page: () => ProfilePage()),
          GetPage(name: '/board/write', page: () => WriteBoardPage()),
          GetPage(name: '/path/store', page: () => StorePathPage()),
          GetPage(name: '/board/detail', page: () => BoardDetailPage()),
        ],
      );
    }
}