import 'dart:ui';

import 'package:health_status/Architecture/Result.dart';

import 'OldUser.dart';


abstract class IDataSource{

  void insert(OldUser user);
  OldUser findById(int id);
  void delete(OldUser user);
  void update(OldUser user);

  List<OldUser> getAll();
  Result getByLoginAndPass(String login, String pass);
  String findIntialsOfFullName(String fullName);
  Future init();
  Future setUser(OldUser user);
  OldUser? getUser();
  Color statusHealthy(String textHeatlh);




}