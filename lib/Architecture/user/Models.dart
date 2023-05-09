import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';
@JsonSerializable()

class User{
  final int id;
  final String login;
  final String pass;
  final int role;

  User({required this.id, required this.login, required this.pass, required this.role});


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);


}