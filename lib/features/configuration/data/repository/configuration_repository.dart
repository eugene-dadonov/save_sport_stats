import 'package:sport_stats_live/features/configuration/data/storage/configuration_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';

class ConfigurationRepositoryImpl extends ConfigurationRepository {
  final ConfigurationStorage storage;

  ConfigurationRepositoryImpl({required this.storage});

  @override
  void delete(String id) async {
    await storage.deleteConfiguration(id);
  }

  @override
  Future<List<Configuration>> getConfigurations() async =>
      await storage.getConfigurations();

  @override
  Future<Configuration> getConfigurationById(String id) async =>
      await storage.getConfiguration(id);

  @override
  Future<void> saveConfiguration(Configuration configuration) async =>
      await storage.saveConfiguration(configuration);
}
