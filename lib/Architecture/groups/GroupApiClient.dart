import 'dart:convert';
import 'dart:io';
import 'package:health_status/Architecture/ManagerToken/TokenManagmer.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'IStudentSource.dart';
import 'package:http/http.dart' as http;




class GroupApiClient implements IStudentSource{

  final client = HttpClient();


  @override
  Result<Student> delete(Student student) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future init() async {
    final temp = await TokenManager.getUserToken();
    final token = temp;
    return token;
  }

  late final token;


  ///Использует библиотеку Http
  Future<Result<List<Student>>> getAll(String token) async {


    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    final response = await http.get(
      Uri.parse('http://5.181.109.158:91/api/User/getAllUser'),
      headers: headers,
    );

    final List<dynamic> jsonResponse = jsonDecode(response.body);

    final List<Student> students = jsonResponse.map((item) {
      final healthEmployStatus =
          item['healthEmployStatus'] as Map<String, dynamic>;
      final id = item['id'] as int;
      final imageName = item['imageName'] as String;
      final fullName = item['fullName'] as String;
      final textHealthStatus = healthEmployStatus['textHealthStatus'] as String;


      return Student.fromJson({
        'id': id,
        'imageName': imageName,
        'fullName': fullName,
        'textHealthStatus': textHealthStatus,
      });
    }).toList();

    return Result.success(students);
  }






  @override
  Result<List<Student>> getByGroupId(int id) {
    // TODO: implement getByGroupId
    throw UnimplementedError();
  }

  @override
  Result<Student> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Result<Student> insert(Student student) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Result<Student> update(Student student) {
    // TODO: implement update
    throw UnimplementedError();
  }

}