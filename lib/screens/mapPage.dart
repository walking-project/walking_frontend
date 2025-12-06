import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/menu.dart';
import 'package:geolocator/geolocator.dart';
import '../utils/getCurrentPosition.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

const greyColor = 0xff8C8C8C;

class positionController extends GetxController {
  var lat = 37.5665.obs;
  var lon = 126.9780.obs;

  setLatitude(double val) => lat.value = val;
  setLongitude(double val) => lon.value = val;
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  List<LatLng> points = []; // 상태임
  bool isRecord = false;
  StreamSubscription<Position>? positionStream;

  positionController posController = Get.put(positionController());
  GoogleMapController? mapController;

  @override
  void initState() { // 맨 처음에 딱 한 번만 실행할 함수
    super.initState();
  }

  Future<void> loadPosition() async {
      try {
        final position = await determinePosition();
        posController.setLatitude(position.latitude);
        posController.setLongitude(position.longitude);

        if(mapController != null) {
          mapController!.animateCamera( // !은 null이 아님을 나타냄
            CameraUpdate.newLatLng(
              LatLng(position.latitude, position.longitude)
            )
          );
        }
      } catch(err) {
        print('position load error: $err');
      }
  }

  void updatePosition(Position position) {
      setState(() {
        points.add(LatLng(position.latitude, position.longitude));
      });
  }

  void startPath() async {
    print('Streaming start.');
    setState(() {
      points.clear();
    });
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1,
      )
    ).listen((Position pos) {
      final point = LatLng(pos.latitude, pos.longitude);
      print('Streaming lat: ${pos.latitude}, lon: ${pos.longitude}');
      updatePosition(pos);
      mapController?.animateCamera(
        CameraUpdate.newLatLng(point)
      );
    });
  }

  void stopPath() async {
    if(positionStream == null) print('경로 시작을 먼저 눌러주세요.');
    else {
      positionStream!.cancel();
      print('Stream canceled');
    };
  }

  @override
  Widget build(BuildContext context) {
      final input = buildInput();
      final menu = buildMenu();
      final startBtn = buildButton('경로 시작', startPath);
      final storeBtn = buildButton('경로 저장', stopPath);

      return MaterialApp (
        title: '지도',
        home: Scaffold(
          body: Stack(
            children: [
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          input,
                        ]
                      )
                    )
                  ),
                  Obx(() => 
                    GoogleMap(
                      onMapCreated: (controller) async {
                        mapController = controller;
                        await loadPosition(); // google map이 만들어질 때 loadPosition 호출
                      },
                      initialCameraPosition: CameraPosition(
                        zoom: 17,
                        target: LatLng(posController.lat.value, posController.lon.value)
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('current'),
                          position: LatLng(posController.lat.value, posController.lon.value),
                        )
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      polylines: {
                        Polyline(
                          polylineId: const PolylineId('walkingPath'),
                          points: points,
                          width: 5,
                        )
                      },
                    )
                  ),
                  Positioned(
                    bottom: 170,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 332,
                        height: 60,
                        child: startBtn,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 332,
                        height: 60,
                        child: storeBtn,
                      ),
                    )
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: menu,
                  ),
                ],
              )
          )
        );
    }
}

Container buildInput() {
  return Container(
    margin: EdgeInsets.all(20),
    width: 362,
    height: 60,
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: const Color.fromARGB(227, 255, 255, 255),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.search, size: 24, color: Color(greyColor)), 
        ),
        Text('위치 검색', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ]
    ),
  );
}