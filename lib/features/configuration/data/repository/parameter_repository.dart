import 'package:sport_stats_live/core/base/data/exception/exception_parser.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/data/storage/parameter_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';

class ParameterRepositoryImpl extends ParameterRepository {
  final ParameterStorage storage;

  ParameterRepositoryImpl({required this.storage});

  @override
  Future<Transporter<List<Parameter>>> getParameters() async {
    try {
      final parameters = await storage.getParameters();
      return DataTransporter<List<Parameter>>(data: parameters);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<List<Parameter>>(e, s);
    }
  }

  @override
  Future<Transporter<Parameter>> getParameterById(String id) async {
    try {
      final parameter = await storage.getParameter(id);
      return DataTransporter<Parameter>(data: parameter);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<Parameter>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> saveParameter(Parameter parameter) async {
    try {
      await storage.saveParameter(parameter);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> delete(String id) async {
    try {
      await storage.deleteParameter(id);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }
}
