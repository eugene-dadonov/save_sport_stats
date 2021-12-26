import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/model/parameter_to_return.dart';

abstract class DialogParametersGetState {}

class LoadingView extends DialogParametersGetState {}

class ContentView extends DialogParametersGetState {
  final List<ParameterToReturn> parameters;

  ContentView({
    required this.parameters,
  });
}

class ErrorView extends DialogParametersGetState {}

class ReturnParametersBack extends DialogParametersGetState {
  final List<Parameter> parameters;

  ReturnParametersBack(this.parameters);
}
