import 'package:get/get.dart';
import '../contexts/userContext.dart';
import '../utils/getPaths.dart';

class StoredController extends GetxController {

  var path = [].obs;
  setPath(List val) => path.value = val;

  final userController = Get.find<Controller>();

  @override
  void onInit() async {
    super.onInit();
    final response = await getPaths(userController.id.value);
    print('getPaths response: $response');
    setPath(response);
  }
}