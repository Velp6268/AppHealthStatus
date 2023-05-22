import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';
@JsonSerializable()

class User{
  final int id;
  final String username;
  final String email;
  final int role;
  final String token;


  User({required this.id,required this.username, required this.email,required this.role, required this.token});


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);


}