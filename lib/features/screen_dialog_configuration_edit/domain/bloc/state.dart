import 'package:sport_stats_live/features/configuration/domain/configuration.dart';

abstract class ConfigurationEditScreenState {}

class LoadingView extends ConfigurationEditScreenState {}

class ConfigurationView extends ConfigurationEditScreenState {
  final Configuration configuration;
  final bool isNewConfiguration;

  ConfigurationView({
    required this.configuration,
    required this.isNewConfiguration,
  });
}

class ErrorView extends ConfigurationEditScreenState {
  final String? message;

  ErrorView(this.message);
}
