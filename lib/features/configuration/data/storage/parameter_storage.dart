import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

abstract class ParameterStorage {
  Future<Parameter> getParameter(String id);

  Future<List<Parameter>> getParameters();

  Future<void> saveParameter(Parameter parameter);

  Future<void> deleteParameter(String id);
}
