import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';
import '../widgets/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import '../contexts/userContext.dart';
import '../utils/postPath.dart';


class PathInfoController extends GetxController {
  var name = ''.obs;
  var description = ''.obs;

  setName(String val) => name.value = val;
  setDescription(String val) => description.value = val;
}

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class StorePathPage extends StatelessWidget {

    PathInfoController ipathController = Get.put(PathInfoController());
    final userController = Get.find<Controller>();
    final header = buildHeader('경로 저장하기');
    final path = Get.arguments['path'];

    @override
    Widget build(BuildContext context) {
      final cancelBtn = buildButton('취소', () => Get.toNamed('/map'));
      final confirmBtn = buildButton('확인', () async {
          final userid = await userController.id.value;
          final response = await postPath(userid, ipathController.name.value, ipathController.description.value, path);
          print('response: $response');
          Get.toNamed('/stored');
        }
      );
      final nameInput = buildInput('경로 이름', 60, double.infinity, ipathController.setName);
      final descriptionInput = buildInput('경로 설명', 165, double.infinity, ipathController.setDescription);
      GoogleMapController? mapController;

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
                              child: GoogleMap(
                                onMapCreated: (controller) async {
                                  mapController = controller;
                                },
                                initialCameraPosition: CameraPosition(
                                  zoom: 17,
                                  target: path[0],
                                ),
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                polylines: {
                                  Polyline(
                                    polylineId: const PolylineId('walkingPath'),
                                    points: path,
                                    width: 5,
                                  )
                                },
                              )
                            ),
                            nameInput,
                            descriptionInput,
                            // Container (
                            //   height: 360,
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     color: Color(lightGreyColor),
                            //     borderRadius: BorderRadius.circular(15),
                            //   ),
                            //   child: GestureDetector(
                            //     child: Container(
                            //       width: double.infinity,
                            //       height: double.infinity,
                            //       child: Center(
                            //         child: Column(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Icon(Icons.cloud_upload, color: Color(greyColor), size: 80),
                            //             Text('사진 업로드', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                            //           ]
                            //         )
                            //       ),
                            //     )
                            //   ),
                            // ),
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