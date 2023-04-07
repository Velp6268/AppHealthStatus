import 'dart:ui';

import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/resources/resources.dart';

import 'User.dart';

class LoginRepository {
  final IDataSource remote;
  final IDataSource local;

  LoginRepository(this.remote, this.local);

  List<User> getAll() {
    return remote.getAll();
  }

  Result login(String login, String pass) {
    return remote.getByLoginAndPass(login, pass);
  }


  Color textHealthyStatus(String textHealthy){
    return remote.statusHealthy(textHealthy);
  }


  String nameAndInitials(String fullName){
    return remote.findIntialsOfFullName(fullName);
  }

  Future<User?> init() async {
    return local.getUser();
  }

  Future setUser(User user){
    return remote.setUser(user);
  }

  User? getUser(){
    return remote.getUser();
  }


}
