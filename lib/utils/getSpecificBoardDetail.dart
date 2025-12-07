import 'package:dio/dio.dart';

Future<List<dynamic>> getSpecificBoardDetail(String postId) async{
  print('getSpecificBoardDetail start: $postId');
  final dio = Dio();

  final response = await dio.get('http://localhost:4040/board/$postId');
  print('response: ${response.data}');
  return response.data as List<dynamic>;
}