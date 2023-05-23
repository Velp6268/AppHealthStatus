import 'dart:convert';

import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';
import 'package:http/http.dart' as http;

import 'Models.dart';

class StatusApiClient implements IStatusSource {
  @override
  Future<Result> changeStatusHealthy(int idNewStatus, int id,
      String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/changeHealthStatus');
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json", // Указываем тип данных как application/json
    };

    final data = {
      'id': id,
      'idNewStatus': idNewStatus,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    return Result.success(response);


  }

  @override
  Future<Result<Status>> getByUserId(int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/$id');

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final dynamic responseBody = jsonDecode(response.body);

      final healthEmployStatus = responseBody['healthEmployStatus'] as Map<String, dynamic>;
      final id = responseBody['id'] as int;
      final imageName = responseBody['imageName'] as String;
      final textHealthStatus = healthEmployStatus['textHealthStatus'] as String;

      final student = Status(
        id: id,
        imageName: imageName,
        textHealthStatus: textHealthStatus,
      );

      return Result.success(student);
    } else {
      return Result.error('NotFound') as Result<Status>;

    }
  }
}

