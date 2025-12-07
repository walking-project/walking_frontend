import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../utils/getBoards.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/getSpecificBoardDetail.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;

class BoardController extends GetxController {
  var boards = [].obs;

  setBoards(List list) => boards.value = list;

  @override
  void onInit() async {
    super.onInit();
    loadBoards();
  }

  Future<void> loadBoards() async {
    print('loadBoards start.');
    try {
      final result = await getBoards();
      print('getBoards result: $result');
      setBoards(result);
    } catch(e,s) {
      print('loadBoards error: $e');
      print('s: $s');
    }
  }
}

class BoardPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

      final header = buildHeader('게시판');
      final menu = buildMenu();
      final input = buildInput('게시글 검색', 60, double.infinity);
      final button = buildButton('글쓰기', () => Get.toNamed('/board/write'));
      BoardController boardController = Get.put(BoardController());

      void onTap(String postId) async {
        final response = await getSpecificBoardDetail(postId);
        print('response: $response');
        Get.toNamed('/board/detail', arguments: {'detail': response[0]});
      }

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
                      child: Column(
                        children: [
                          input,
                          button,
                          SizedBox(
                            width: 20,
                          ),
                          Obx(() => Column(
                            children: [...boardController.boards.value.map((board) => GestureDetector(onTap: () => onTap(board['postId']), child: boardModal(board['title'], board['userid'], board['postId'].toString())))],
                          )),
                        ]
                      )
                    )
                  )
                ),
                menu
              ]
            )
          ),
        )
      );
    }
}

Container boardModal(String title, String name, String postId, [dynamic onTap, String? imageUrl]) {
  GoogleMapController? mapController;
  BoardController boardController = Get.find<BoardController>();
  return Container(
    key: ValueKey(postId),
    width: double.infinity,
    height: 160,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(20, 0, 0, 0),
          blurRadius: 8,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
              Text('작성자: $name', style: TextStyle(color: Color(greyColor), fontSize: 10, fontWeight: FontWeight.w500)),
            ]
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Obx(() {
                final b = boardController.boards.value;
                final idx = b.indexWhere((e) => e['postId'] == postId);
                if(idx == -1){
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(greyColor),
                      ),
                    );
                }
                else {
                  final rpoints = b[idx]['point'];
                  if(rpoints is! List || rpoints.isEmpty) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(greyColor),
                      ),
                    );
                  }
                  final points = rpoints.cast<Map<String, dynamic>>();
                  return (GoogleMap(
                      onMapCreated: (controller) async {
                        mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        zoom: 15,
                        target: LatLng(points[0]['x'], points[0]['y'])
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      polylines: {
                        Polyline(
                          polylineId: const PolylineId('walkingPath'),
                          points: points.map((p) => LatLng(p['x'], p['y'])).toList(),
                          width: 5,
                        )
                      },
                  ));
                }
            }
          )
        ),
      ]
    )
  );
}

