import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/network/repository/rest_client_repository.dart';

import 'api_bloc_bloc.dart';
import 'api_bloc_event.dart';
import 'api_bloc_state.dart';

export 'api_bloc_bloc.dart';
export 'api_bloc_event.dart';
export 'api_bloc_state.dart';

class ApiBlocBloc extends Bloc<ApiBlocEvent, ApiBlocState> {
  final RestClientRepo repo;

  static create(RestClientRepo repo) => ApiBlocBloc._(repo);

  ApiBlocBloc._(this.repo);

  @override
  ApiBlocState get initialState => InitialApiBlocState();

  @override
  Stream<ApiBlocState> mapEventToState(
    ApiBlocEvent event,
  ) async* {
    if(event is GetTaskEvent) yield* _mapEventToState(event);
  }

  Stream<ApiBlocState> _mapEventToState(GetTaskEvent event) async*{
    final response = await repo.getTask();
    print(response);
    yield GetTaskSuccess(response);
  }
}
