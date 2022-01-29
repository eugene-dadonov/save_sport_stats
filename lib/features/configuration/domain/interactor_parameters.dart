import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';

class InteractorParameters {
  final ParameterRepository _repository;

  InteractorParameters(this._repository);

  Future<Transporter<List<Parameter>>> getAll() => _repository.getParameters();

  Future<Transporter<Parameter>> getById(String id) =>
      _repository.getParameterById(id);

  Future<Transporter<bool>> save(Parameter configuration) =>
      _repository.saveParameter(configuration);

  Future<Transporter<bool>> delete(String id) => _repository.delete(id);
}
