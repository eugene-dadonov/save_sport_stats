import 'package:sport_stats_live/features/configuration/domain/configuration.dart';

abstract class ConfigurationRepository {
  Future<void> saveConfiguration(Configuration configuration);

  Future<List<Configuration>> getConfigurations();

  Future<Configuration> getConfigurationById(String id);

  void delete(String id);
}
