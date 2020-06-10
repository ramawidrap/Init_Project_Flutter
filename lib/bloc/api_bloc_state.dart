import 'package:flutter_app/model/task_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ApiBlocState {}

class InitialApiBlocState extends ApiBlocState {}

class GetTaskSuccess extends ApiBlocState {
  final List<TaskModel> listTask;

  GetTaskSuccess(this.listTask);


}
