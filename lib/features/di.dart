import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/navigation/navigation_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/cubit.dart';
import 'package:sport_stats_live/features/configuration/data/repository/configuration_repository.dart';
import 'package:sport_stats_live/features/configuration/data/repository/parameter_repository.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/configuration_repository.dart';
import 'package:sport_stats_live/features/configuration/domain/repository/parameter_repository.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/match_interactor.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/bottom_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/cubit_toolbar.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/home.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_screen.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_view.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_start_new_match_view.dart';
import 'package:sport_stats_live/features/screen_settings/bloc/settings_cubit.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/bloc/cubit_new_team_screen.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/bloc/cubit_add_new_team_view.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/bloc/cubit_screen_teams.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/data/storage/hive_team_storage.dart';
import 'package:sport_stats_live/features/team/data/storage/team_storage.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';
import 'package:sport_stats_live/features/team/domain/team_interactor.dart';
import 'configuration/data/storage/configuration_hive_storage.dart';
import 'configuration/data/storage/configuration_storage.dart';
import 'configuration/data/storage/parameter_hive_storage.dart';
import 'configuration/data/storage/parameter_storage.dart';
import 'match/data/repository/match_repository.dart';
import 'match/data/storage/hive_match_storage.dart';
import 'match/data/storage/match_storage.dart';
import 'match/domain/repository/match_repository.dart';
import 'screen_teams_list/presentation/bloc/cubit_teams.dart';

class DependencyInjector {
  GetIt dependencies = GetIt.instance;

  prepareDependencies(bool showInto) async {
    await _registerStorages(true);
    _registerRepositories();
    _registerInteractors();
    _registerMainBlocs();
    _registerAppBloc();

    _addSettingsBlocs();
    _addTeamsBlocs();
    _addMatchesBlocs();
  }

  _registerStorages(bool withTestMatches) async {
    await Hive.initFlutter();

    final hiveParametersStorage = HiveParameterStorage();
    await hiveParametersStorage.init();

    final hiveConfigurationStorage = HiveConfigurationStorage();
    await hiveConfigurationStorage.init();

    final hiveTeamStorage = HiveTeamStorage();
    await hiveTeamStorage.init();

    final hiveMatchStorage = HiveMatchStorage();
    await hiveMatchStorage.init();

    if (withTestMatches) {
      await hiveParametersStorage.createDemoParameters();
      await hiveConfigurationStorage.createDemoConfigurations();
      await hiveTeamStorage.createDemoTeams();
      await hiveMatchStorage.createDemoMatches();
    }

    await _singleton<ConfigurationStorage>(() => hiveConfigurationStorage);
    await _singleton<ParameterStorage>(() => hiveParametersStorage);
    await _singleton<MatchStorage>(() => hiveMatchStorage);
    await _singleton<TeamStorage>(() => hiveTeamStorage);
  }

  _registerRepositories() {
    _singleton<ConfigurationRepository>(
        () => ConfigurationRepositoryImpl(storage: dependencies()));

    _singleton<MatchRepository>(
        () => MatchRepositoryImpl(matchStorage: dependencies()));

    _singleton<ParameterRepository>(
        () => ParameterRepositoryImpl(storage: dependencies()));

    _singleton<TeamRepository>(
        () => TeamRepositoryImpl(teamStorage: dependencies()));
  }

  _registerInteractors() {
    _factory<MatchInteractor>(
        () => MatchInteractor(repository: dependencies()));

    _factory<TeamInteractor>(() => TeamInteractor(repository: dependencies()));
  }

  _registerMainBlocs() {
    _singleton<BlocNavigator>(() => BlocNavigator());

    _factory<MatchBloc>(() => MatchBloc(
          matchRepository: dependencies(),
        ));
  }

  _addSettingsBlocs() {
    _factory<CubitSettings>(() => CubitSettings(app: dependencies()));
  }

  _addTeamsBlocs() {
    _factory<CubitTeamsScreen>(() => CubitTeamsScreen(app: dependencies()));

    _factory<BlocAddNewTeamView>(() => BlocAddNewTeamView(app: dependencies()));

    _factory<CubitTeamsView>(() => CubitTeamsView(
          app: dependencies(),
          teamInteractor: dependencies(),
        ));

    /// New Team
    _factory<CubitNewTeamScreen>(() => CubitNewTeamScreen(
          app: dependencies(),
          interactor: dependencies(),
        ));
  }

  _addMatchesBlocs() {
    _factory<BlocMatchesView>(() => BlocMatchesView(
          dependencies(),
          app: dependencies(),
          matchBloc: dependencies(),
        ));

    _factory<BlocStartNewMatchView>(
        () => BlocStartNewMatchView(app: dependencies()));

    _factory<BlocMatchesScreen>(() => BlocMatchesScreen(
          app: dependencies(),
          blocMatchesView: dependencies(),
          blocStartNewMatchView: dependencies(),
        ));
  }

  _registerAppBloc() {
    _singleton(
      () => AppBloc(
        dependencies: dependencies,
        navigator: dependencies(),
      ),
    );

    _singleton<BlocTheme>(() => BlocTheme(app: dependencies()));

    _singleton<BlocBottomTab>(() => BlocBottomTab(app: dependencies()));

    _singleton<BlocToolbar>(() => BlocToolbar(app: dependencies()));

    _singleton<BlocHome>(
      () => BlocHome(
        app: dependencies(),
        bottomTab: dependencies(),
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
