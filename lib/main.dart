import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/app.dart';

import 'features/match/data/repository/match_repository.dart';
import 'features/match/data/storage/hive_match_storage.dart';

void main() async {
  final hiveMatchStorage = HiveMatchStorage();
  await hiveMatchStorage.init();
  await hiveMatchStorage.createDemoMatches();
  hiveMatchStorage.showMatches();

  runApp(RepositoryProvider(
      create: (BuildContext context) =>
          MatchRepositoryImpl(matchStorage: hiveMatchStorage),
      child: const MyApp()));
}
