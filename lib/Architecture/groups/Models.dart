import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';

@JsonSerializable()
class Student{
  final int userId;
  final String imageName;
  final String fullName;
  final String textHealsStatus;

  Student({
    required this.userId,
    required this.imageName,
    required this.fullName,
    required this.textHealsStatus
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

}