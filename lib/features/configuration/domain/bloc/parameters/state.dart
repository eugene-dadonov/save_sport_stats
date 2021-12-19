import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

enum ParametersStateStatus {
  loading,
  updated,
  error,
}

class ParametersState {
  final ParametersStateStatus status;
  final List<Parameter> parameters;
  final String? message;

  ParametersState({
    required this.status,
    required this.parameters,
    required this.message,
  });

  ParametersState.loading()
      : status = ParametersStateStatus.loading,
        message = null,
        parameters = [];

  ParametersState.updated({
    required this.parameters,
  })  : message = null,
        status = ParametersStateStatus.updated;

  ParametersState.error({
    required this.message,
  })  : status = ParametersStateStatus.error,
        parameters = [];
}
