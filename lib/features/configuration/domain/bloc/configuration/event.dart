import '../../configuration.dart';

abstract class ConfigurationEvent {}

class Init extends ConfigurationEvent {}

class SaveConfiguration extends ConfigurationEvent {
  final Configuration configuration;

  SaveConfiguration({
    required this.configuration,
  });
}

class DeleteConfiguration extends ConfigurationEvent {
  final String id;

  DeleteConfiguration({
    required this.id,
  });
}
