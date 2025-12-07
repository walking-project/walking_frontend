import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walking_client/contexts/colorContext.dart';

const greyColor = 0xff8C8C8C;

Container buildMenu([String? status]) {
  final menuController controller = Get.find<menuController>();
  return Container(
    height: 90,
    decoration: BoxDecoration(color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/map');
            controller.setMap(true);
          },
          // onTapUp: controller.setMap(true),
          // onTapDown: controller.setMap(false),
          child: Obx(() => Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map_outlined, color: Color(controller.mapColor.value), size: 40),
                Text('지도', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(controller.mapColor.value)),),
              ]
            )
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/stored');
            controller.setStored(true);
          },
          // onTapUp: controller.setStored(true),
          // onTapDown: controller.setStored(false),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bookmark, color: Color(controller.storedColor.value), size: 40),
              Text('저장된 경로', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(controller.storedColor.value))),
            ]
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/board');
            controller.setBoard(true);
          },
          // onTapUp: controller.setBoard(true),
          // onTapDown: controller.setBoard(false),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_square, color: Color(controller.boardColor.value), size: 40),
              Text('게시판', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(controller.boardColor.value))),
            ]
          ), 
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/profile');
            controller.setProfile(true);
          },
          // onTapUp: controller.setStored(true),
          // onTapDown: controller.setStored(false),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Color(controller.profileColor.value), size: 40),
              Text('프로필', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(controller.profileColor.value))),
            ]
          ),
        ),
      ]
    )
  );
}