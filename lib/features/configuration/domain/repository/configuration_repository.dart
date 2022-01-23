import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';

abstract class ConfigurationRepository {
  Future<Transporter<bool>> saveConfiguration(Configuration configuration);

  Future<Transporter<List<Configuration>>> getConfigurations();

  Future<Transporter<Configuration>> getConfigurationById(String id);

  Future<Transporter<bool>> delete(String id);
}
