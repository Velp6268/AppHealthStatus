import 'dart:convert';
import 'dart:ui';

//import 'package:health_status/Theme/app_colors.dart';

class User {
  final int id;
  final String email;
  final String password;
  final String fullName;
  late final String imageName;
  late final String? textHealthStatus;


  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.imageName,
    required this.textHealthStatus
});

  static fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    fullName: json['fullName'],
    imageName: json['imageName'],
    textHealthStatus:  json['textHealthStatus']
  );

  Map<String, dynamic> toJson()=>{
    'id': id,
    'email': email,
    'password': password,
    'fullName': fullName,
    'imageName' : imageName,
    'textHealthStatus' : textHealthStatus
  };


  User copy({
    int? id,
    String? email,
    String? password,
    String? fullName,
    String? imageName,
    String? textHealthStatus
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    fullName: fullName ?? this.fullName,
    imageName: imageName ?? this.imageName,
    textHealthStatus: textHealthStatus ?? this.textHealthStatus
  );

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
