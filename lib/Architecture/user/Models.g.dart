// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      login: json['login'] as String,
      pass: json['pass'] as String,
      role: json['role'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'pass': instance.pass,
      'role': instance.role,
    };
