import 'package:sport_stats_live/features/configuration/data/storage/parameter_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';

class ParameterRepositoryImpl extends ParameterRepository {
  final ParameterStorage storage;

  ParameterRepositoryImpl({required this.storage});

  @override
  Future<List<Parameter>> getParameters() async => await storage.getParameters();

  @override
  Future<Parameter> getParameterById(String id) async =>
      await storage.getParameter(id);

  @override
  Future<void> saveParameter(Parameter parameter) async =>
      await storage.saveParameter(parameter);

  @override
  void delete(String id) async => await storage.deleteParameter(id);
}
