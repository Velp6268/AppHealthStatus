import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/groups/IStudentSource.dart';
import 'package:health_status/Architecture/groups/Models.dart';
import 'package:health_status/resources/resources.dart';

class GroupRemoteDbMock implements IStudentSource {
  final students = [
    Student(
        imageName: AppImages.maks,
        fullName: 'Ночевный Максим Юрьевич',
        textHealsStatus: 'Я здоров'),
    Student(
        imageName: AppImages.nikita,
        fullName: 'Лазарев Никита Сергеевич',
        textHealsStatus: 'Я болен'),
    Student(
        imageName: AppImages.tim,
        fullName: 'Комарденков Тимофей Дмитреевич',
        textHealsStatus: 'Я здоров'),
    Student(
        imageName: AppImages.vitalya,
        fullName: 'Платонов Виталий Ильич',
        textHealsStatus: 'Уехал по делам'),
  ];

  @override
  Result<Student> delete(Student student) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Result<List<Student>> getAll() {
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


