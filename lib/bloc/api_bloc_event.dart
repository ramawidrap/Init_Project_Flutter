import 'package:meta/meta.dart';

@immutable
abstract class ApiBlocEvent {}

class GetTaskEvent extends ApiBlocEvent {
}
