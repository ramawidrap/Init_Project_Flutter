import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bloc/api_bloc_bloc.dart';
import 'package:flutter_app/network/rest_client_service.dart';
import 'package:flutter_app/network/repository/rest_client_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class AppModule {
  final Widget app;
  final GetIt injector = GetIt.instance;

  AppModule(this.app);

  void configureService() {
    injector.registerSingleton(Dio());
    injector.registerSingleton(RestClient);
    injector.registerSingleton<RestClient>(RestClient.create(injector.get()));
  }

  void configureRepository() {
    injector.registerSingleton(RestClientRepo(injector.get()));
  }

  Widget configureBloc(Widget app) {
    return MultiBlocProvider(providers: [
      BlocProvider<ApiBlocBloc>(
        create: (BuildContext context) => ApiBlocBloc.create(injector.get()),
      )
    ], child: app);
  }

  void setup() {
    configureService();
    configureRepository();
    configureBloc(app);
    print("configure");
  }
}
