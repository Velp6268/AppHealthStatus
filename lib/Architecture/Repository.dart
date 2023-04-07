import 'dart:ui';

import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/resources/resources.dart';

import 'User.dart';

class LoginRepository {
  final IDataSource dataSource;

  LoginRepository(this.dataSource);

  List<User> getAll() {
    return dataSource.getAll();
  }

  Result login(String login, String pass) {
    return dataSource.getByLoginAndPass(login, pass);
  }


  Color textHealthyStatus(String textHealthy){
    return dataSource.statusHealthy(textHealthy);
  }


  String nameAndInitials(String fullName){
    return dataSource.findIntialsOfFullName(fullName);
  }

  Future init(){
    return dataSource.init();
  }

  Future setUser(User user){
    return dataSource.setUser(user);
  }

  User? getUser(){
    return dataSource.getUser();
  }


}
