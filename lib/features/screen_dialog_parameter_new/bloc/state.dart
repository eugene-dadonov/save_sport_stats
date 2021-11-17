import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

abstract class ParameterEditState {}

class Loading extends ParameterEditState {}

class ParameterLoaded extends ParameterEditState {
  final Parameter parameter;
  final bool isNewParameter;

  ParameterLoaded({
    required this.parameter,
    required this.isNewParameter,
  });
}

class Error extends ParameterEditState {
  final String? message;

  Error(this.message);
}

class ParameterSaved extends ParameterEditState {}
