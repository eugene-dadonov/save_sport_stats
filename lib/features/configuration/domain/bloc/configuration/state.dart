import 'package:sport_stats_live/features/configuration/domain/configuration.dart';

enum ConfigurationStatus {
  loading,
  updated,
  error,
}

class ConfigurationState {
  final ConfigurationStatus status;
  final List<Configuration> configurations;
  final String? message;

  ConfigurationState({
    required this.status,
    required this.configurations,
    required this.message,
  });

  ConfigurationState.loading()
      : status = ConfigurationStatus.loading,
        message = null,
        configurations = [];

  ConfigurationState.updated({
    required this.configurations,
  })  : message = null,
        status = ConfigurationStatus.updated;

  ConfigurationState.error({
    required this.message,
  })  : status = ConfigurationStatus.error,
        configurations = [];
}
