import 'package:flutter/material.dart';

import 'package:flutter_app/bloc/api_bloc_bloc.dart';
import 'package:flutter_app/ui/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<ApiBlocBloc>(this.context).add(GetTaskEvent());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return Scaffold(
      body: BlocBuilder<ApiBlocBloc, ApiBlocState>(
        builder: (context, state) {
          if (state is GetTaskSuccess) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(state.listTask.length.toString()),
                RaisedButton(
                  child: Text("Go to Another Page"),
                  onPressed: () async => await SecondPage.goToSecondPage(context: context),
                )
              ],
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
