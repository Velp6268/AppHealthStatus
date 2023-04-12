import 'dart:ui';

import 'package:health_status/Architecture/IDataSourse.dart';
import 'package:health_status/Architecture/Result.dart';
import 'package:health_status/resources/resources.dart';

import 'OldUser.dart';

class LoginRepository {
  final IDataSource remote;
  final IDataSource local;

  LoginRepository(this.remote, this.local);

  List<OldUser> getAll() {
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

  Future<OldUser?> init() async {
    return local.getUser();
  }

  Future setUser(OldUser user){
    return remote.setUser(user);
  }

  OldUser? getUser(){
    return remote.getUser();
  }


}
