import '../parameter.dart';

abstract class ParameterRepository {
  Future<void> saveParameter(Parameter parameter);

  Future<List<Parameter>> getParameters();

  Future<Parameter> getParameterById(String id);

  void delete(String id);
}
