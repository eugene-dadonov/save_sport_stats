import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/core/base/data/exception/exceptions.dart';
import 'package:sport_stats_live/features/configuration/data/model/configuration_model.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/match/data/converters/match_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/team_shot_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/exception/exception.dart';
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
    Hive.registerAdapter<MatchModel>(MatchModelAdapter());
    Hive.registerAdapter<AttributeModel>(AttributeModelAdapter());
    Hive.registerAdapter<TeamShotModel>(TeamShotModelAdapter());

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
  Future<bool> saveMatch(Match match) async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    MatchModel matchModel = MatchConverter.toModel(match);

    await box.put(matchModel.id, matchModel);
    return true;
  }

  @override
  Future<List<Match>> getAllMatches() async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    return box.values.map((match) => MatchConverter.fromModel(match)).toList();
  }

  @override
  Future<Match> getMatch(String id) async {
    final box = Hive.box<MatchModel>(boxMatchStorage);
    final matchModel = box.get(id);
    if (matchModel == null) {
      throw NoElementWithSuchId(errorMessage: "No match with this id: $id!");
    } else {
      return MatchConverter.fromModel(matchModel);
    }
  }

  @override
  Future<Match> getActiveMatch() async {
    final activeMatchBox = Hive.box<String>(boxActiveMatch);
    final String? activeMatchId = activeMatchBox.get(activeMatchKey);
    if (activeMatchId == null) {
      throw NoElementWithSuchId(errorMessage: "No Active match saved!");
    }

    final matchBox = Hive.box<MatchModel>(boxMatchStorage);
    final matchModel = matchBox.get(activeMatchId);

    if (matchModel == null) {
      throw NoElementWithSuchId(
          errorMessage: "No match with this id: $activeMatchId!");
    } else {
      return MatchConverter.fromModel(matchModel);
    }
  }

  @override
  Future<bool> updateActiveMatchWithId(String id) async {
    final box = Hive.box<String>(boxActiveMatch);
    await box.put(activeMatchKey, id);
    return true;
  }

  @override
  Future<bool> deleteMatch(String id) async {
    final matchesBox = Hive.box<MatchModel>(boxMatchStorage);
    final matchModel = matchesBox.get(id);
    final activeMatchBox = Hive.box<String>(boxActiveMatch);
    final String? activeMatchId = activeMatchBox.get(activeMatchKey);

    if (matchModel != null) {
      matchesBox.delete(matchModel.id);

      if (matchModel.id == activeMatchId) {
        activeMatchBox.delete(activeMatchKey);
      }
      return true;
    } else {
      return false;
    }
  }
}
