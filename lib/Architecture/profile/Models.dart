import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';
@JsonSerializable()

class ProfileUser{
  final int userId;
  String fullName;
  final String group;
  String imageName;
  final String? textHealthStatus;
  ProfileUser({required this.userId, required this.fullName, required this.group, required this.imageName, required this.textHealthStatus});


  factory ProfileUser.fromJson(Map<String, dynamic> json) => _$ProfileUserFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);
}