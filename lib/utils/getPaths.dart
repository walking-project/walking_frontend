import 'package:dio/dio.dart';

Future<List<dynamic>> getPaths(String userid) async{
  print('getPaths start: $userid');
  final dio = Dio();

  final response = await dio.get('http://localhost:4040/path/$userid');
  print('response: ${response.data}');
  return response.data as List<dynamic>;
}