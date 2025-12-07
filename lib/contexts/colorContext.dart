import 'package:get/get.dart';

const greyColor = 0xff8C8C8C;

class menuController extends GetxController {
  var mapColor = 0xff51D32D.obs;
  var storedColor = 0xff8C8C8C.obs;
  var boardColor = 0xff8C8C8C.obs;
  var profileColor = 0xff8C8C8C.obs;

  setMap(bool isActive) {
    if(isActive) {
      mapColor.value = 0xff51D32D;
      storedColor.value = 0xff8C8C8C;
      boardColor.value = 0xff8C8C8C;
      profileColor.value = 0xff8C8C8C;
    }
    else {
      mapColor.value = 0xff8C8C8C;
    }
  }

  setStored(bool isActive) {
    if(isActive) {
      mapColor.value = 0xff8C8C8C;
      storedColor.value = 0xff51D32D;
      boardColor.value = 0xff8C8C8C;
      profileColor.value = 0xff8C8C8C;
    }
    else {
      storedColor.value = 0xff8C8C8C;
    }
  }

  setBoard(bool isActive) {
    if(isActive) {
      mapColor.value = 0xff8C8C8C;
      storedColor.value = 0xff8C8C8C;
      boardColor.value = 0xff51D32D;
      profileColor.value = 0xff8C8C8C;
    }
    else {
      boardColor.value = 0xff8C8C8C;
    }
  }

  setProfile(bool isActive) {
    if(isActive) {
      mapColor.value = 0xff8C8C8C;
      storedColor.value = 0xff8C8C8C;
      boardColor.value = 0xff8C8C8C;
      profileColor.value = 0xff51D32D;
    }
    else {
      profileColor.value = 0xff8C8C8C;
    }
  }
}