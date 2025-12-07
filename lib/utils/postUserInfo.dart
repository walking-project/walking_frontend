import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final dio = Dio();

Future<String> postUserInfo(String id, String nickname, String password) async {
  debugPrint('signUp button pressed: $id, $nickname, $password');
  final response = await dio.post('http://localhost:4040/user', data: {'userid': id, 'username': nickname, 'password': password});
  final data = response.data;
  print('data: $data');
  final dynamic token = data['accessToken'];
  if(token == '' || token == null) throw Exception('토큰이 존재하지 않습니다.');
  return token;
}