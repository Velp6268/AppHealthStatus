import 'dart:ui';

//import 'package:health_status/Theme/app_colors.dart';

class OldUser {
  final int id;
  final String email;
  final String password;
  final String fullName;
  final String group;
  late final String imageName;
  final String? textHealthStatus;

  OldUser({
      required this.id,
      required this.email,
      required this.password,
      required this.fullName,
      required this.group,
      required this.imageName,
      required this.textHealthStatus});

  static fromJson(Map<String, dynamic> json) => OldUser(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      group: json['group'],
      imageName: json['imageName'],
      textHealthStatus: json['textHealthStatus']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'fullName': fullName,
        'group': group,
        'imageName': imageName,
        'textHealthStatus': textHealthStatus,
      };

  OldUser copy({
    int? id,
    String? email,
    String? password,
    String? fullName,
    String? group,
    String? imageName,
    String? textHealthStatus,
  }) =>
      OldUser(
          id: id ?? this.id,
          email: email ?? this.email,
          password: password ?? this.password,
          fullName: fullName ?? this.fullName,
          group: group ?? this.group,
          imageName: imageName ?? this.imageName,
          textHealthStatus: textHealthStatus ?? this.textHealthStatus);

  String get OldUser_name {
    return fullName;
  }

  void set OldUser_name(String fullName) {
    fullName = fullName;
  }

  int get id_OldUser {
    return id;
  }

  void set id_OldUser(int id) {
    id = id;
  }
}
