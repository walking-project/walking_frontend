import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/header.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../contexts/userContext.dart';
import '../utils/postBoardDetail.dart';
import '../screens/boardPage.dart';
import '../contexts/pathContext.dart';
import './storedPage.dart';
import '../contexts/boardContentContext.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WriteBoardPage extends StatelessWidget {
  BoardContentController controller = Get.put(BoardContentController());
  Controller userController = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    final bController = Get.find<BoardContentController>();
    final header = buildHeader('글쓰기');
    final titleInput = buildInput('제목', null, null, controller.setTitle);
    final contentInput = buildInput('내용 입력', 300, null, controller.setContent);
    final button = buildButton('확인', () async {
      final response = await postBoardDetail(controller.title.value, controller.content.value, userController.id.value, bController.path.value);
      print(response);
      final boardController = Get.find<BoardController>();
      await boardController.loadBoards();
      Get.toNamed('/board');
    });
    final selectButton = buildButton('경로 선택', () {
      showDialog(
        context: context,
        builder: (context) {
          return PathLists();
        }
      );
    });

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
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        titleInput,
                        contentInput,
                        selectButton,
                        Container(
                          width: 360,
                          height: 360,
                          child: Obx(() {
                            if(bController.path.value.isEmpty) {
                              return Container(
                                child: Text('loading...'),
                              );
                            }
                            else {
                              return(
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: GoogleMap(
                                      onMapCreated: (controller) async {
                                        mapController = controller;
                                      },
                                      initialCameraPosition: CameraPosition(
                                        zoom: 15,
                                        target: LatLng(bController.path.value[0]['x'], bController.path.value[0]['y'])
                                      ),
                                      myLocationEnabled: true,
                                      myLocationButtonEnabled: true,
                                      zoomControlsEnabled: false,
                                      polylines: {
                                        Polyline(
                                          polylineId: const PolylineId('walkingPath'),
                                          points: bController.path.value.map((p) => LatLng(p['x'], p['y'])).toList(),
                                          width: 5,
                                        )
                                      },
                                  )
                                ) 
                              );
                            }
                          })
                        ),
                        button,
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}

class PathLists extends StatelessWidget {
  PathLists({Key? key}) : super(key: key);
  final sController = Get.find<StoredController>();
  final bController = Get.find<BoardContentController>();
  
  @override
  Widget build(BuildContext context) {

    void onTap(List path) {
      bController.setPath(path);
      Navigator.pop(context);
    }

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 280,
        height: 600,
        child: Obx(() => Column(
          children: [
            ...sController.path.value.map((p) => buildModal(p['name'], p['point'], p['pathId'].toString(), () => onTap(p['point']))).toList()
          ]
        ))
      )
    );
  }
}