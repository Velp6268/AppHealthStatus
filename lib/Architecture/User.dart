import 'dart:ui';

//import 'package:health_status/Theme/app_colors.dart';

class User {
  final int id;
  final String email;
  final String password;
  final String fullName;
  final String group;
  late final String imageName;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.group,
    required this.imageName,
});


  static fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    fullName: json['fullName'],
    group: json['group'],
    imageName: json['imageName'],
  );

  Map<String, dynamic> toJson()=>{
    'id': id,
    'email': email,
    'password': password,
    'fullName': fullName,
    'group': group,
    'imageName' : imageName,
  };


  User copy({
    int? id,
    String? email,
    String? password,
    String? fullName,
    String? group,
    String? imageName,
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    password: password ?? this.password,
    fullName: fullName ?? this.fullName,
    group: group ?? this.group,
    imageName: imageName ?? this.imageName,
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
