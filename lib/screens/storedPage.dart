import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/input.dart';
import '../widgets/menu.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../contexts/pathContext.dart';

const greyColor = 0xff8C8C8C;
const lightGreyColor = 0xffD9D9D9;
class StoredPage extends StatelessWidget {

    final header = buildHeader('저장된 경로');
    final menu = buildMenu();
    final input = buildInput('경로 검색', 60, double.infinity);
    final sController = Get.put(StoredController());

    @override
    Widget build(BuildContext context) {
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
                      decoration: BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      child: Obx(() => Column(
                        children: [
                          ...sController.path.value.map((p) => buildModal(p['name'], p['point'], p['pathId'].toString())).toList()
                        ]
                      ))
                    ),
                  )
                ),
                menu
              ]
            ),
          )
        )
      );
    }
}

GestureDetector buildModal(String title, List points, String pathId, [dynamic onTap, String? info, String? imageUrl]) {
  GoogleMapController? mapController;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      key: ValueKey(pathId),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: GoogleMap(
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
                    )
          ),
          Column(
            children: [
              Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
              if(info != null) Text(info, style: TextStyle(color: Color(greyColor), fontSize: 16, fontWeight: FontWeight.w400)),
            ]
          )
        ]
      )
    )
  );
}