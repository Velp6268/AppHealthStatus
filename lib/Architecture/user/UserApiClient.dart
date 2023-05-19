import 'dart:convert';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/user/Models.dart';
import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:http/http.dart' as http;
import 'package:health_status/Architecture/Result.dart';

import '../auth/ILoginDataSource.dart';

class UserApiClient implements ILoginDataSource {
  @override
  Result getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }


  @override
  Future<Result> getByLoginAndPass(String email, String pass) async {
    final String url = 'http://5.181.109.158:91/api/Auth/login'; // Замените URL на ваш реальный URL авторизации

    final Map<String, dynamic> requestData = {
      'email': email,
      'password': pass,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final dynamic responseBody = jsonDecode(response.body);
      User user = User.fromJson(
          responseBody);
      return Result.success(user);
    } else {
      return Result.error("Логин или пароль не верны");
    }
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  
  
}