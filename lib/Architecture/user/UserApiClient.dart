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
  Future<Result>getByLoginAndPass(String email, String pass) async {
    final String url = 'http://5.181.109.158:91/api/Auth/login';
    final Map<String, dynamic> requestData = {
      'email': email,
      'password': pass,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestData),
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var body = response.body;
      final jsonResponse = jsonDecode(response.body);
      final result = jsonResponse.map((item) => (item)).toList();

      //stop
      return Result.success(result);
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