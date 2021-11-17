import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

enum ConfigurationListStatus {
  loading,
  update,
  error,
}

class ConfigurationListState {
  final ConfigurationListStatus configurationListStatus;
  final List<Configuration> configurations;
  final String? configurationMessage;
  final List<Parameter> parameters;
  final String? parametersMessage;

  ConfigurationListState(
    this.configurationListStatus,
    this.configurations,
    this.parameters,
    this.configurationMessage,
    this.parametersMessage,
  );

  ConfigurationListState.loading()
      : configurationListStatus = ConfigurationListStatus.loading,
        configurations = [],
        configurationMessage = null,
        parameters = [],
        parametersMessage = null;

  ConfigurationListState.update({
    required this.configurations,
    required this.configurationMessage,
    required this.parameters,
    required this.parametersMessage,
  }) : configurationListStatus = ConfigurationListStatus.update;

  ConfigurationListState.error({
    required this.parametersMessage,
    required this.configurationMessage,
  })  : configurationListStatus = ConfigurationListStatus.error,
        parameters = [],
        configurations = [];
}
