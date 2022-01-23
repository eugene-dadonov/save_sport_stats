import 'dart:async';

import 'package:sport_stats_live/core/base/data/exception/exception_parser.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/configuration/data/storage/configuration_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';

class ConfigurationRepositoryImpl extends ConfigurationRepository {
  final ConfigurationStorage storage;

  ConfigurationRepositoryImpl({required this.storage});

  @override
  Future<Transporter<bool>> delete(String id) async {
    try {
      await storage.deleteConfiguration(id);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }

  @override
  Future<Transporter<List<Configuration>>> getConfigurations() async {
    try {
      final configurations = await storage.getConfigurations();
      return DataTransporter<List<Configuration>>(data: configurations);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<List<Configuration>>(
          e, s);
    }
  }

  @override
  Future<Transporter<Configuration>> getConfigurationById(String id) async {
    try {
      final configuration = await storage.getConfiguration(id);
      return DataTransporter<Configuration>(data: configuration);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<Configuration>(e, s);
    }
  }

  @override
  Future<Transporter<bool>> saveConfiguration(
      Configuration configuration) async {
    try {
      await storage.saveConfiguration(configuration);
      return DataTransporter<bool>(data: true);
    } catch (e, s) {
      return ExceptionParser.handleToErrorTransporter<bool>(e, s);
    }
  }
}
