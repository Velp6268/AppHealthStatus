// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
    Id: json['Id'] as int,
    username: json['username'] as String,
    email: json['email'] as String,
    role: json['role'] as int,
    token: json['token'] as String

    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.Id,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'token': instance.token

    };
