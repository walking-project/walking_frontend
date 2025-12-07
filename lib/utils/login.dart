import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> showAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('알림'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('로그인 오류'),
            ]
          )
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('확인'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]
      );
    }
  );
}

Future<Object> login(String id, String password, String token) async {
  print('login start: $id, $password, $token');
  final baseOptions = BaseOptions(
    headers: {'Authorization': 'Bearer $token'}
  );
  final dio = Dio(baseOptions);
  try {
    final response = await dio.post('http://localhost:4040/user/login', data: {'userid': id, 'password': password});
    print('response: $response, status: ${response.statusCode}, data: ${response.data}');
    return true;
  } on DioException catch (e) {
    final status = e.response?.statusCode;
    final message = e.response?.data;
    print('error: [$status] $message');
    return false;
  }
}