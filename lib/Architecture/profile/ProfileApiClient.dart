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

    final response =
        await http.patch(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final result = ProfileUser.fromJson(jsonDecode(response.body));
      return Result.success(result);
    } else {
      return Result.error('Failed to update name');
    }
  }

  @override
  Result<ProfileUser> getById(int id, String token) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result> getByUserId(int id, String token) async {
    final url = Uri.parse('http://5.181.109.158:91/api/User/$id');

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };


    final response = await http.get(url, headers: headers);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final data = jsonDecode(response.body) as List<dynamic>;
      if (data.isEmpty) {
        return Result.error('Profile not found');
      } else {
        final profile = ProfileUser.fromJson(data.first);
        return Result.success(profile);
      }
    } else {
      return Result.error('Failed to fetch profile');
    }
  }

}