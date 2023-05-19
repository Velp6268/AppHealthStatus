import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';
@JsonSerializable()

class User{
  final int Id;
  final String email;
  final String password;
  final int role;
  final String token;

  User({required this.Id, required this.email, required this.password, required this.role, required this.token});


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);


}