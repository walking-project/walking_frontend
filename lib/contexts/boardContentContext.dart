import 'package:get/get.dart';

class BoardContentController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;
  var path = [].obs;

  setTitle(String val) => title.value = val;
  setContent(String val) => content.value = val;
  setPath(List val) => path.value = val;
}