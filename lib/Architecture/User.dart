import 'dart:ui';

//import 'package:health_status/Theme/app_colors.dart';

class User {
  final int id;
  final String email;
  final String password;
  final String fullName;
  late final String imageName;
  late final Color? healthStatus;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.imageName,
    required this.healthStatus
});



  String get user_name {
    return fullName;
  }

  void set user_name(String fullName) {
    fullName = fullName;
  }

  int get id_user {
    return id;
  }

  void set id_user(int id) {
    id = id;
  }

  

}
