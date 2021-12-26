import 'package:get_it/get_it.dart';
import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/navigation/navigation_bloc.dart';
import 'package:sport_stats_live/features/configuration/data/repository/configuration_repository.dart';
import 'package:sport_stats_live/features/configuration/data/repository/parameter_repository.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/data/storage/hive_team_storage.dart';
import 'package:sport_stats_live/features/team/data/storage/team_storage.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

import 'configuration/data/storage/configuration_hive_storage.dart';
import 'configuration/data/storage/configuration_storage.dart';
import 'configuration/data/storage/parameter_hive_storage.dart';
import 'configuration/data/storage/parameter_storage.dart';
import 'match/data/repository/match_repository.dart';
import 'match/data/storage/hive_match_storage.dart';
import 'match/data/storage/match_storage.dart';
import 'match/domain/repository/match_repository.dart';

class DependencyInjector {
  GetIt dependencies = GetIt.instance;

  prepareDependencies(bool showInto) {
    _registerStorages(true);
    _registerRepositories();
    _registerBlocs();
    _registerAppBloc();
  }

  _registerStorages(bool withTestMatches) {
    _singleton<ConfigurationStorage>(() => HiveConfigurationStorage()..init());
    _singleton<ParameterStorage>(() => HiveParameterStorage()..init());
    _singleton<MatchStorage>(() => HiveMatchStorage()..init());
    _singleton<TeamStorage>(() => HiveTeamStorage()..init());

    if (withTestMatches) {
      (dependencies.get<ConfigurationStorage>() as HiveConfigurationStorage)
          .createDemoConfigurations();
      (dependencies.get<ParameterStorage>() as HiveParameterStorage)
          .createDemoParameters();
      (dependencies.get<MatchStorage>() as HiveMatchStorage)
          .createDemoMatches();
      (dependencies.get<TeamStorage>() as HiveTeamStorage).createDemoTeams();
    }
  }

  _registerRepositories() {
    _singleton<TeamRepository>(
        () => TeamRepositoryImpl(teamStorage: dependencies()));

    _singleton<MatchRepository>(
        () => MatchRepositoryImpl(matchStorage: dependencies()));

    _singleton<ConfigurationRepository>(
        () => ConfigurationRepositoryImpl(storage: dependencies()));

    _singleton<ParameterRepository>(
        () => ParameterRepositoryImpl(storage: dependencies()));
  }

  _registerBlocs() {
    _singleton<BlocNavigator>(() => BlocNavigator());
  }

  _registerAppBloc() {
    _singleton(
      () => AppBloc(
        dependencies: dependencies,
        navigator: dependencies(),
      ),
    );
  }

  _factory<T extends Object>(T Function() creator) {
    dependencies.registerFactory<T>(creator);
  }

  _factoryParam<T extends Object, T2, T3>(T Function(T2, T3) creator) {
    dependencies.registerFactoryParam<T, T2, T3>(creator);
  }

  _singleton<T extends Object>(T Function() creator) {
    dependencies.registerSingleton<T>(creator());
  }

  _singletonLazy<T extends Object>(T Function() creator) {
    dependencies.registerLazySingleton<T>(creator);
  }
}
