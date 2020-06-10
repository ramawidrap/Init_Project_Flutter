import 'package:flutter_app/model/task_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'restClient.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {

  static create(Dio dio,{String baseUrl}) => _RestClient(dio);

  @GET("/tasks")
  Future<List<TaskModel>> getTasks();
}


