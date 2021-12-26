import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/features/app/presentation/app.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/data/storage/configuration_hive_storage.dart';
import 'package:sport_stats_live/features/configuration/data/storage/parameter_hive_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'core/theming/domain/bloc/bloc.dart';
import 'features/configuration/data/repository/configuration_repository.dart';
import 'features/configuration/data/repository/parameter_repository.dart';
import 'features/configuration/domain/bloc/configuration/bloc.dart';
import 'features/match/data/repository/match_repository.dart';
import 'features/match/data/storage/hive_match_storage.dart';
import 'features/match/domain/bloc/bloc.dart';
import 'features/screen_home/domain/bloc/bloc.dart';
import 'features/team/data/repository/team_repository_impl.dart';
import 'features/team/data/storage/hive_team_storage.dart';

void main() async {
  await Hive.initFlutter();

  final hiveParametersStorage = HiveParameterStorage();
  await hiveParametersStorage.init();
  await hiveParametersStorage.createDemoParameters();

  final hiveConfigurationStorage = HiveConfigurationStorage();
  await hiveConfigurationStorage.init();
  await hiveConfigurationStorage.createDemoConfigurations();

  final hiveTeamStorage = HiveTeamStorage();
  await hiveTeamStorage.init();
  await hiveTeamStorage.createDemoTeams();

  final hiveMatchStorage = HiveMatchStorage();
  await hiveMatchStorage.init();
  await hiveMatchStorage.createDemoMatches();

  hiveMatchStorage.showMatches();
  hiveTeamStorage.showTeams();
  hiveConfigurationStorage.showLog();
  hiveParametersStorage.showLog();

  runApp(
    _RepositoriesProvider(
      hiveTeamStorage: hiveTeamStorage,
      hiveMatchStorage: hiveMatchStorage,
      hiveConfigurationStorage: hiveConfigurationStorage,
      hiveParameterStorage: hiveParametersStorage,
      child: const _BaseBlocsProvider(
        child: ThemeBuilder(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class _RepositoriesProvider extends StatelessWidget {
  final HiveTeamStorage hiveTeamStorage;
  final HiveMatchStorage hiveMatchStorage;
  final HiveParameterStorage hiveParameterStorage;
  final HiveConfigurationStorage hiveConfigurationStorage;
  final Widget child;

  const _RepositoriesProvider({
    Key? key,
    required this.child,
    required this.hiveTeamStorage,
    required this.hiveMatchStorage,
    required this.hiveParameterStorage,
    required this.hiveConfigurationStorage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (BuildContext context) =>
                MatchRepositoryImpl(matchStorage: hiveMatchStorage)),
        RepositoryProvider(
            create: (BuildContext context) =>
                TeamRepositoryImpl(teamStorage: hiveTeamStorage)),
        RepositoryProvider(
            create: (BuildContext context) =>
                ParameterRepositoryImpl(storage: hiveParameterStorage)),
        RepositoryProvider(
            create: (BuildContext context) =>
                ConfigurationRepositoryImpl(storage: hiveConfigurationStorage)),
      ],
      child: child,
    );
  }
}

class _BaseBlocsProvider extends StatelessWidget {
  final Widget child;

  const _BaseBlocsProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {
          return TeamsBloc(teamRepository: context.read<TeamRepositoryImpl>());
        }),
        BlocProvider(create: (BuildContext context) {
          return MatchBloc(
              matchRepository: context.read<MatchRepositoryImpl>());
        }),
        BlocProvider(create: (BuildContext context) {
          return TabBloc();
        }),
        BlocProvider(create: (BuildContext context) {
          return ThemeBloc(ThemeState(light));
        }),
        BlocProvider(create: (BuildContext context) {
          return ParameterBloc(
              repository: context.read<ParameterRepositoryImpl>());
        }),
        BlocProvider(create: (BuildContext context) {
          return ConfigurationBloc(
              repository: context.read<ConfigurationRepositoryImpl>());
        }),
      ],
      child: child,
    );
  }
}

class ThemeBuilder extends StatelessWidget {
  final Widget child;

  const ThemeBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return ThemeHolder(child: child, theme: state.appThemeData);
    });
  }
}
