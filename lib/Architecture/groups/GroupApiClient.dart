import 'dart:convert';
import 'dart:io';
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


  // Future<Result<List<Student>>> getAll() async{
  //   final url = Uri.parse('http://192.168.31.53:3000/users');
  //   final request = await client.getUrl(url);
  //   request.headers.set('X-Jsio-Token', '6b69f9a013ccc689c400ab6082520a02');
  //   final response = await request.close();
  //   final jsonStrings = await response.transform(utf8.decoder).toList();
  //   final jsonString = jsonStrings.join();
  //   final json = jsonDecode(jsonString) as List<dynamic>;
  //   final posts = json
  //       .map((e) => Student.fromJson(e as Map<String, dynamic>))
  //       .toList();
  //
  // print(posts);
  //
  //   return Result.success(posts);
  // }




  ///Использует библиотеку Http
  Future<Result<List<Student>>> getAll() async{
    final response = await http.get(
      Uri.parse('http://172.20.10.5:91/api/Auth/login'), ///читаем данные с сайта
    );
    final List<dynamic> jsonResponse = jsonDecode(response.body); ///Преобразовние строк в данные
    final List<Student> students = jsonResponse.map((item) => Student.fromJson(item)).toList(); ///Заносит данные в список
    print(students);
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