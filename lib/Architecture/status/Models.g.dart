// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  id: json['id'] as int,
      imageName: json['imageName'] as String,
      textHealthStatus: json['textHealthStatus'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'imageName': instance.imageName,
      'textHealthStatus': instance.textHealthStatus,
    };
