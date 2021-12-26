import 'package:sport_stats_live/features/configuration/domain/configuration.dart';

abstract class ConfigurationStorage {
  Future<Configuration> getConfiguration(String id);

  Future<List<Configuration>> getConfigurations();

  Future<void> saveConfiguration(Configuration configuration);

  Future<void> deleteConfiguration(String id);
}
