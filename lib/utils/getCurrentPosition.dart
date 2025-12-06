import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool enable;
  LocationPermission permission;

  enable = await Geolocator.isLocationServiceEnabled();
  if(!enable) return Future.error('Location unauthorized.');
  permission = await Geolocator.requestPermission();
  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) return Future.error('Location permissions are denied');
  }
  if(permission == LocationPermission.deniedForever) return Future.error('Location Permissions are denied forever.');

  final position = await Geolocator.getCurrentPosition();
  print('latitude: ${position.latitude}, longitude: ${position.longitude}');

  return position;
}