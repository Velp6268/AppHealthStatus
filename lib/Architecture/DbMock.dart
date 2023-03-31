import 'package:flutter/cupertino.dart';
import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/User.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:collection/collection.dart';

class DbMock implements IDataSource {
  final _students = [
    User(
        id: 1,
        email: "bagor6268@gmail.com",
        password: "1111",
        fullName: 'Ночевный М.Ю.',
        imageName: AppImages.maks,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 2,
        email: "Lazar@gmail.com",
        password: "1111",
        fullName: 'Лазарев Н.С.',
        imageName: AppImages.nikita,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 3,
        email: "Komord@gmail.com",
        password: "1111",
        fullName: 'Комарденков Т.Д.',
        imageName: AppImages.tim,
        healthStatus: AppColors.statusAnother),
    User(
        id: 4,
        email: "Plat@gmail.com",
        password: "1111",
        fullName: 'Платонов В.И.',
        imageName: AppImages.vitalya,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 4,
        email: "1111",
        password: "1111",
        fullName: 'Неизвестный Н.Н.',
        imageName: AppImages.city,
        healthStatus: AppColors.statusUnHealthy),
  ];

  Result getByLoginAndPass(String login, String pass) {
    try {
      var result = _students.firstWhere(
          (element) => element.email == login && element.password == pass);
      return Result.success(result);
    } on StateError {
      return Result.error("Логин или пароль не верны");
    }
  }



  @override
  void delete(User user) {
    // TODO: implement delete
  }

  @override
  User findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  List<User> getAll() {
    // TODO: implement getAll
    return _students;
  }

  @override
  void insert(User idUser) {
    // TODO: implement insert
  }

  @override
  void update(User user) {
    // TODO: implement update
  }
}
