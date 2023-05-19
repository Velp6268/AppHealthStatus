// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      Id: json['Id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as int,
      token: json['token'] as String
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.Id,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'token': instance.token
    };
