import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskModel {
  @JsonKey()
  String id;

  @JsonKey()
  String name;

  @JsonKey()
  String avatar;

  @JsonKey()
  String createdAt;

  TaskModel(this.id, this.name, this.avatar, this.createdAt);

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}