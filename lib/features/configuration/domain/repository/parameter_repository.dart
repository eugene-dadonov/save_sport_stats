import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';

import '../parameter.dart';

abstract class ParameterRepository {
  Future<Transporter<bool>> saveParameter(Parameter parameter);

  Future<Transporter<List<Parameter>>> getParameters();

  Future<Transporter<Parameter>> getParameterById(String id);

  Future<Transporter<bool>> delete(String id);
}
