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
        fullName: 'Ночевный Максим Юрьевич',
        group: "32Д",
        imageName: AppImages.maks,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 2,
        email: "Lazar@gmail.com",
        password: "1111",
        fullName: 'Лазарев Никита.Сергеевич.',
        group: "32Д",
        imageName: AppImages.nikita,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 3,
        email: "Komord@gmail.com",
        password: "1111",
        fullName: 'Комарденков Тимофей.Дмитриевич.',
        group: "32Д",
        imageName: AppImages.tim,
        healthStatus: AppColors.statusAnother),
    User(
        id: 4,
        email: "Plat@gmail.com",
        password: "1111",
        fullName: 'Платонов Виталий.Ильич.',
        group: "32Д",
        imageName: AppImages.vitalya,
        healthStatus: AppColors.statusHealthy),
    User(
        id: 4,
        email: "1111",
        password: "1111",
        fullName: 'Неизвестный Ноу Нейм',
        group: "32Д",
        imageName: AppImages.city,
        healthStatus: AppColors.statusUnHealthy),
  ];



  @override
  String statusHealthyText(User user){

    if(user.healthStatus == AppColors.statusHealthy){
      return'Здооров';
    }
    if(user.healthStatus == AppColors.statusUnHealthy){
      return 'Не здоров';
    }
    if(user.healthStatus == AppColors.statusAnother){
      return 'Отсуствует по обстоятельствам';
    }

    return '';
  }

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
  String findIntialsOfFullName(String fullName) {
    String sername, name, midleName, result;

    var listWordsName = fullName.split(" ");

    sername = listWordsName[0];
    name = listWordsName[1].substring(0, 1) + ".";
    midleName = listWordsName[2].substring(0, 1) + ".";

    result = sername + " " + name + midleName;

    return result;
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
