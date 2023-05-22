import 'dart:convert';

import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/status/IStatusSource.dart';
import 'package:http/http.dart' as http;

import 'Models.dart';

class StatusApiClient implements IStatusSource{
  @override
  Future<Result> changeStatusHealthy(int idNewStatus, int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/changeHealthStatus');
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final data = {
      'id': id,
      'idNewStatus': idNewStatus,
    };

    final response =
        await http.patch(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final result = Status.fromJson(jsonDecode(response.body));
      return Result.success(result);
    } else {
      return Result.error('Failed to update name');
    }
  }

  @override
  Future<Result> getByUserId(int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/$id');

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };


    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      if (data.isEmpty) {
        return Result.error('Profile not found');
      } else {
        final profile = Status.fromJson(data.first);
        return Result.success(profile);
      }
    } else {
      return Result.error('Failed to fetch profile');
    }
  }

}