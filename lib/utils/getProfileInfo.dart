import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


Future<List<Map<String, dynamic>>> getProfileInfo(String token, String id) async {
  print('getProfileInfo start');
  final baseOptions = BaseOptions(
    headers: {'Authorization': 'Bearer $token'}
  );
  final dio = Dio(baseOptions);
  debugPrint('getProfileInfo start');
  final response = await dio.get('http://localhost:4040/user/$id');
  final data = response.data;
  print(data);
  // gpt code
  if (data is List) {
    // 각 요소를 Map<String, dynamic>으로 안전하게 변환
    return data.map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e as Map)).toList();
  } else if (data is Map) {
    // 혹시 서버가 배열이 아닌 객체 하나만 줄 때 대비
    return [Map<String, dynamic>.from(data)];
  } else {
    throw Exception('Unexpected response type: ${data.runtimeType}');
  }
  // gpt code
}