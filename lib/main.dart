import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/api_bloc_bloc.dart';
import 'package:flutter_app/app_module.dart';
import 'package:flutter_app/ui/home.dart';
import 'package:flutter_app/ui/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Router.dart';

final dependency = AppModule(Home());

void main() {
  print("launch app");

  dependency.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return dependency.configureBloc(MaterialApp(onGenerateRoute: Router.generateRouter,initialRoute: Router.initialPage,));
  }
}
