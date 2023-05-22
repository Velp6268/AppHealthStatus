// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as int,
      imageName: json['imageName'] as String,
      fullName: json['fullName'] as String,
      textHealthStatus: json['textHealthStatus'] as String,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'imageName': instance.imageName,
      'fullName': instance.fullName,
      'textHealthStatus': instance.textHealthStatus,
    };
