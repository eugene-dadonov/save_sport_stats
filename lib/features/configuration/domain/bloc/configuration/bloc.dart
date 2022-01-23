import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/event.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/state.dart';
import 'package:sport_stats_live/features/configuration/domain/exception/configuration_exception.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  ConfigurationBloc({
    required this.repository,
  }) : super(ConfigurationState.loading());

  final ConfigurationRepository repository;

  @override
  Stream<ConfigurationState> mapEventToState(ConfigurationEvent event) async* {
    // try {
    //   if (event is Init) {
    //     final configurations = await repository.getConfigurations();
    //     yield ConfigurationState.updated(configurations: configurations);
    //   } else if (event is SaveConfiguration) {
    //     await repository.saveConfiguration(event.configuration);
    //     final configurations = await repository.getConfigurations();
    //     yield ConfigurationState.updated(configurations: configurations);
    //   } else if (event is DeleteConfiguration) {
    //     repository.delete(event.id);
    //     final configurations = await repository.getConfigurations();
    //     yield ConfigurationState.updated(configurations: configurations);
    //   }
    // } on NoSuchConfiguration {
    //   yield ConfigurationState.error(message: "Конфигурация не найдена!");
    // } catch (e) {
    //   yield ConfigurationState.error(message: e.toString());
    // }
  }
}
