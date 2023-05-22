import 'package:json_annotation/json_annotation.dart';

part 'Models.g.dart';
@JsonSerializable()

class Status{
  final int id;
  final String imageName;
  final String? textHealthStatus;
  Status({required this.id, required this.imageName, required this.textHealthStatus});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);

}