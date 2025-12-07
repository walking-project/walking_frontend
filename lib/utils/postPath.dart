import 'package:dio/dio.dart';

Future<Object> postPath(String userid, String name, String description, dynamic path) async{
  print('postPath start: $userid');
  final dio = Dio();
  var pathJson = path.map((point) => {'x': point.latitude, 'y': point.longitude}).toList();
  print(pathJson);

  final response = await dio.post('http://localhost:4040/path/$userid', data: {
    'name': name,
    'point': pathJson,
    'description': description,
  });
  print('response: ${response.data}');
  return response.data;
}