
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/api_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Router.dart';

class SecondPage extends StatefulWidget {

  static goToSecondPage({BuildContext context}) async {
    await Navigator.of(context).pushNamed(Router.secondPage);
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondPage();
  }

}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: 100,child: BlocBuilder<ApiBlocBloc,ApiBlocState>(builder: (context,state) {
      if(state is GetTaskSuccess) {
        return ListView.builder(itemBuilder: (context,index){
          return Text(state.listTask[index].name);
        },itemCount: state.listTask.length,);
      }
      else {
        return Center(child:CircularProgressIndicator());
      }
    },),);
  }

}