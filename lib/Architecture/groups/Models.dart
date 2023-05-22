import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';

@JsonSerializable()
class Student{
  final int id;
  final String imageName;
  final String fullName;
  final String textHealthStatus;

  Student({
    required this.id,
    required this.imageName,
    required this.fullName,
    required this.textHealthStatus
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

}