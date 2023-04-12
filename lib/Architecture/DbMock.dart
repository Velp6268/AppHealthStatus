import 'dart:async';
import 'dart:convert';
import '../../../../Architecture/auth/LoggedUserRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/Architecture/OldUser.dart';
import 'package:health_status/Theme/app_colors.dart';
import 'package:health_status/resources/resources.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/UserSession.dart';


class DbMock implements IDataSource {

  static late SharedPreferences _preferences;

  static const _keyUser = 'user'; ///Ключ

  final _students = [
    OldUser(
        id: 1,
        email: '2222',
        password: '1111',
        fullName: 'Ночевный Максим Юрьевич',
        group: '32Д',
        imageName: AppImages.maks,
        textHealthStatus: 'Я здоров'
       ),
    OldUser(
        id: 2,
        email: 'Lazar@gmail.com',
        password: '1111',
        fullName: 'Лазарев Никита Сергеевич',
        group: '32Д',
        imageName: AppImages.nikita,
        textHealthStatus: 'Я здоров'
        ),
    OldUser(
        id: 3,
        email: 'Komord@gmail.com',
        password: '1111',
        fullName: 'Комарденков Тимофей Дмитриевич',
        group: '32Д',
        imageName: AppImages.tim,
        textHealthStatus: 'Я здоров'
        ),
    OldUser(
        id: 4,
        email: 'Plat@gmail.com',
        password: '1111',
        fullName: 'Платонов Виталий Ильич.',
        group: '32Д',
        imageName: AppImages.vitalya,
        textHealthStatus: 'Уехал'
        ),
    OldUser(
        id: 5,
        email: '1111',
        password: '1111',
        fullName: 'Неизвестный Ноу Нейм',
        group: '32Д',
        imageName: AppImages.city,
        textHealthStatus: 'Я болен'
        ),
  ];


  Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  ///Метод для сохранения пользователя локально
  Future setUser(OldUser user) async{
    final json = jsonEncode(user.toJson()); ///Преобразовываем пользовательский объект в toJson

    await _preferences.setString(_keyUser, json);
  }

  Color statusHealthy(String? textHealthy){
    if(textHealthy == "Я здоров")
      return AppColors.statusHealthy;
    else if(textHealthy == "Я болен")
      return AppColors.statusUnHealthy;
    else
      return AppColors.statusAnother;
  }

  OldUser? getUser(){
    final json = _preferences.getString(_keyUser);
    final myUser = UserSession.get();
    var local = OldUser.fromJson(jsonDecode(json!));
    return json == null ? myUser : OldUser.fromJson(jsonDecode(json));
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
  void delete(OldUser user) {
    // TODO: implement delete
  }

  @override
  OldUser findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  List<OldUser> getAll() {

    return _students;
  }

  @override
  void insert(OldUser idUser) {
    // TODO: implement insert
  }

  @override
  void update(OldUser user) {
    // TODO: implement update
  }


}
