import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

abstract class DialogParametersGetEvent {}

class Init extends DialogParametersGetEvent {}

class ReturnParameters extends DialogParametersGetEvent {}

class AddParameter extends DialogParametersGetEvent {
  final Parameter parameter;

  AddParameter(this.parameter);
}

class RemoveParameter extends DialogParametersGetEvent {
  final Parameter parameter;

  RemoveParameter(this.parameter);
}
