import 'package:dio/dio.dart';

Future<Object> postBoardDetail(String title, String content, String userid) async{
  print('postBoardDetail start: $title, $content, $userid');
  final dio = Dio();

  final response = await dio.post('http://localhost:4040/board/$userid', data: {'title': title, 'content': content, 'time': DateTime.now().toIso8601String()});
  print('response: ${response.data}');
  return response.data;
}