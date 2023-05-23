import 'dart:convert';
import 'dart:io';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/Architecture/profile/IProfileSource.dart';
import 'package:health_status/Architecture/profile/Models.dart';
import 'package:http/http.dart' as http;

class ProfileApiClient implements IProfileSource {
  @override

  Future<Result> changeImage(String img, int id, String token) async {
    final url = Uri.parse('http://example.com/profile/$id');

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final body = jsonEncode({'imageName': img});



    final response = await http.patch(url, body: body, headers: headers);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final result = ProfileUser.fromJson(jsonDecode(response.body));
      return Result.success(result);
    } else {
      return Result.error('Failed to update image');
    }
  }

  @override
  Future<Result> changeName(String name, int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/changeName');
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final data = {
      'id': id,
      'fullName': name,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    return Result.success(response);
  }

  @override
  Result<ProfileUser> getById(int id, String token) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result<ProfileUser>> getByUserId(int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/$id');

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final dynamic responseBody = jsonDecode(response.body);

      final healthEmployStatus = responseBody['healthEmployStatus'] as Map<String, dynamic>;
      final group = responseBody['group'] as Map<String, dynamic>;
      final id = responseBody['id'] as int;
      final imageName = responseBody['imageName'] as String;
      final textHealthStatus = healthEmployStatus['textHealthStatus'] as String;
      final groupName = group['group'] as String;
      final fullName = responseBody['fullName'] as String;

      final student = ProfileUser(
        id: id,
        imageName: imageName,
        textHealthStatus: textHealthStatus,
        group: groupName,
        fullName: fullName
      );

      return Result.success(student);
    } else {
      return Result.error('NotFound') as Result<ProfileUser>;

    }
  }

}