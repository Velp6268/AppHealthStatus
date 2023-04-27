// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      userId: json['userId'] as int,
      imageName: json['imageName'] as String,
      fullName: json['fullName'] as String,
      textHealsStatus: json['textHealsStatus'] as String,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'userId': instance.userId,
      'imageName': instance.imageName,
      'fullName': instance.fullName,
      'textHealsStatus': instance.textHealsStatus,
    };
