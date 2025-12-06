import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  var btnColor = 0xff51D32D.obs;
  setBtnActive(bool isActive) => btnColor.value = (isActive? 0xffE7F5E4 : 0xff51D32D);
}

Widget buildButton(String text, [dynamic onTap]) {

  final ColorController controller = Get.put(ColorController());

  return Obx(() => GestureDetector (
    onTap: onTap,
    onTapDown: (_) {
      controller.setBtnActive(true);
    },
    onTapUp: (_) {
      controller.setBtnActive(false);
    },
    onTapCancel: () {
      controller.setBtnActive(false);
    },
    child: Container(
      width: 332,
      height: 60,
      decoration: BoxDecoration(
        color: Color(controller.btnColor.value),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ) 
        )
      ),
    )
  ));
}