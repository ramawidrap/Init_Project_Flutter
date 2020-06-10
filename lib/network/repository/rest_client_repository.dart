import 'package:flutter_app/network/rest_client_service.dart';
import 'package:flutter_app/model/task_model.dart';
import 'package:dio/dio.dart';

class RestClientRepo {
  final RestClient _restClient;

  RestClientRepo(this._restClient);

  Future<List<TaskModel>> getTask() async {
    final response = await _restClient.getTasks();
    return response;
  }
}