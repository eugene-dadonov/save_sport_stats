import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/app.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

import 'features/match/data/repository/match_repository.dart';
import 'features/match/data/storage/hive_match_storage.dart';
import 'features/team/data/repository/team_repository_impl.dart';
import 'features/team/data/storage/hive_team_storage.dart';

void main() async {
  await Hive.initFlutter();

  final hiveMatchStorage = HiveMatchStorage();
  await hiveMatchStorage.init();
  await hiveMatchStorage.createDemoMatches();

  final hiveTeamStorage = HiveTeamStorage();
  await hiveTeamStorage.init();
  await hiveTeamStorage.createDemoTeams();

  hiveMatchStorage.showMatches();
  hiveTeamStorage.showTeams();

  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (BuildContext context) =>
                MatchRepositoryImpl(matchStorage: hiveMatchStorage)),
        RepositoryProvider(
            create: (BuildContext context) =>
                TeamRepositoryImpl(teamStorage: hiveTeamStorage))
      ],
      child: BlocProvider(
          create: (BuildContext context) {
            return TeamsBloc(
                teamRepository: context.read<TeamRepositoryImpl>());
          },
          child: const MyApp())));
}
