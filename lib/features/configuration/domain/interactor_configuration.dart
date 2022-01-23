import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';

class InteractorConfiguration {
  final ConfigurationRepository _repository;

  InteractorConfiguration(this._repository);

  Future<Transporter<List<Configuration>>> getAll() =>
      _repository.getConfigurations();

  Future<Transporter<Configuration>> getById(String id) =>
      _repository.getConfigurationById(id);

  Future<Transporter<bool>> save(Configuration configuration) =>
      _repository.saveConfiguration(configuration);

  Future<Transporter<bool>> delete(String id) => _repository.delete(id);
}
