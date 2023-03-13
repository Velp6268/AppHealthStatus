import 'dart:ui';

//import 'package:health_status/Theme/app_colors.dart';

class User {
  final int id;
  final String fullName;
  final String imageName;
  final Color? healthStatus;

  User({
    required this.id,
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
