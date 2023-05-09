// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      userId: json['userId'] as int,
      fullName: json['fullName'] as String,
      group: json['group'] as String,
      imageName: json['imageName'] as String,
      textHealthStatus: json['textHealthStatus'] as String?,
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'group': instance.group,
      'imageName': instance.imageName,
      'textHealthStatus': instance.textHealthStatus,
    };
