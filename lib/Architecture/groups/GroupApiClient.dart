import 'dart:convert';
import 'dart:io';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'IStudentSource.dart';

class GroupApiClient implements IStudentSource{

  final client = HttpClient();


  @override
  Result<Student> delete(Student student) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Student>>> getAll() async{
    final url = Uri(scheme: 'https', host: 'vprocese.Tim.com', path: 'group');
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    final posts = json
        .map((e) => Student.fromJson(e as Map<String, dynamic>))
        .toList();

    return Result.success(posts);
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