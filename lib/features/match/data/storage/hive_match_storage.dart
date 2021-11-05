import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';
import 'package:sport_stats_live/features/configuration/data/model/configuration_model.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/match/data/converters/match_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/team_shot_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:uuid/uuid.dart';
import 'match_generator.dart';
import 'match_storage.dart';
import 'models/match_model.dart';
import 'models/attribute_model.dart';

class HiveMatchStorage extends MatchStorage {
  // Boxes:
  static const boxMatchStorage = "boxMatchStorage";
  static const boxActiveMatch = "boxActiveMatch";

  // Keys:
  static const activeMatchKey = 'activeMatchKey';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<MatchModel>(MatchModelAdapter());
    Hive.registerAdapter<AttributeModel>(AttributeModelAdapter());
    Hive.registerAdapter<TeamShotModel>(TeamShotModelAdapter());

    Hive.registerAdapter<ParameterModel>(ParameterModelAdapter());
    Hive.registerAdapter<ConfigurationModel>(ConfigurationModelAdapter());

    await Hive.openBox<MatchModel>(boxMatchStorage);
    await Hive.openBox<String>(boxActiveMatch);
  }

  Future<void> createDemoMatches() async {
    final matches = MatchGenerator.createDemoMatches();

    final matchModels = matches.map((match) => MatchConverter.toModel(match));

    final matchesBox = Hive.box<MatchModel>(boxMatchStorage);

    if (matchesBox.isEmpty) {
      await matchesBox.clear();

      for (var element in matchModels) {
        await matchesBox.put(element.id, element);
      }

      // Добавляем активный матч;
      updateActiveMatchWithId(matches[0].id);
    } else {
      print('Box already has ${matchesBox.length} items');
    }
  }

  void showMatches() {
    final matchesBox = Hive.box<MatchModel>(boxMatchStorage);
    for (var element in matchesBox.values) {
      print(element.id);
    }
  }

  @override
  Future<void> saveMatch(Match match) async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    MatchModel matchModel = MatchConverter.toModel(match);

    await box.put(matchModel.id, matchModel);
  }

  @override
  Future<List<Match>> getAllMatches() async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    return box.values.map((match) => MatchConverter.fromModel(match)).toList();
  }

  @override
  Future<Match?> getMatch(String id) async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    final matchModel = box.values.firstWhereOrNull((match) => match.id == id);
    if (matchModel == null) {
      return null;
    } else {
      return MatchConverter.fromModel(matchModel);
    }
  }

  @override
  Future<Match?> getActiveMatch() async {
    final activeMatchBox = Hive.box<String>(boxActiveMatch);
    final String? activeMatchId = activeMatchBox.get(activeMatchKey);
    if (activeMatchId == null) {
      print("HiveMatchStorage: getActiveMatch: activeMatchId == null");
      return null;
    }
    print("HiveMatchStorage: getActiveMatch: $activeMatchId");

    final matchBox = Hive.box<MatchModel>(boxMatchStorage);
    final matchModel = matchBox.get(activeMatchId);

    if (matchModel == null) {
      print("HiveMatchStorage: getActiveMatch: matchModel == null");

      return null;
    } else {
      return MatchConverter.fromModel(matchModel);
    }
  }

  @override
  Future<void> updateActiveMatchWithId(String id) async {
    final box = Hive.box<String>(boxActiveMatch);
    await box.put(activeMatchKey, id);
    print("updateActiveMatchWithId: Active match id: $id");
  }
}
