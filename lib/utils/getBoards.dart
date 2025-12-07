import 'package:dio/dio.dart';

Future<List<dynamic>> getBoards() async{
  print('getBoards start');
  final dio = Dio();

  final response = await dio.get('http://localhost:4040/board');
  print('response: ${response.data}');
  return response.data as List<dynamic>;
}