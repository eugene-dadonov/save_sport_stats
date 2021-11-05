import 'package:hive_flutter/hive_flutter.dart';
import 'package:collection/collection.dart';
import 'package:sport_stats_live/features/configuration/data/model/configuration_model.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/match/data/converters/match_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/team_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';
import 'package:uuid/uuid.dart';
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
    Hive.registerAdapter<TeamModel>(TeamModelAdapter());
    Hive.registerAdapter<ParameterModel>(ParameterModelAdapter());
    Hive.registerAdapter<ConfigurationModel>(ConfigurationModelAdapter());

    await Hive.openBox<MatchModel>(boxMatchStorage);
    await Hive.openBox<String>(boxActiveMatch);
  }

  Future<void> createDemoMatches() async {
    final team1 =
        Team(name: "ФК Волна", teamColor: TeamColor.lightBlue, city: "Тверь");
    final team2 =
        Team(name: "ФК Метеор", teamColor: TeamColor.red, city: "Ярославль");
    final team3 =
        Team(name: "ФК Сталь", teamColor: TeamColor.grey, city: "Москва");
    final team4 =
        Team(name: "ФК Тролль", teamColor: TeamColor.green, city: "Москва");
    final team5 = Team(
        name: "ФК Шершень", teamColor: TeamColor.orange, city: "Екатеринбург");

    final par1 =
        Parameter(id: const Uuid().v1(), name: "Голы", isDeletable: false);
    final par2 = Parameter(id: const Uuid().v1(), name: "Удары");
    final par3 = Parameter(id: const Uuid().v1(), name: "Удары в створ");
    final par4 = Parameter(id: const Uuid().v1(), name: "Фолы");
    final par5 = Parameter(id: const Uuid().v1(), name: "Ауты");
    final par6 = Parameter(id: const Uuid().v1(), name: "Угловые");

    // Cчет
    final attrGoal1 = Attribute(parameter: par1, host: 3, guest: 1);
    final attrGoal2 = Attribute(parameter: par1, host: 1, guest: 1);
    final attrGoal3 = Attribute(parameter: par1, host: 2, guest: 4);

    // Удары
    final attrKick1 = Attribute(parameter: par2, host: 21, guest: 14);
    final attrKick2 = Attribute(parameter: par2, host: 6, guest: 11);
    final attrKick3 = Attribute(parameter: par2, host: 7, guest: 5);

    // Удары в створ
    final attrKickInTarget1 = Attribute(parameter: par3, host: 13, guest: 6);
    final attrKickInTarget2 = Attribute(parameter: par3, host: 4, guest: 7);
    final attrKickInTarget3 = Attribute(parameter: par3, host: 5, guest: 4);

    // Фолы
    final attrFoul1 = Attribute(parameter: par4, host: 11, guest: 10);
    final attrFoul2 = Attribute(parameter: par4, host: 12, guest: 9);
    final attrFoul3 = Attribute(parameter: par4, host: 9, guest: 6);

    // Ауты
    final attrOut1 = Attribute(parameter: par5, host: 31, guest: 51);
    final attrOut2 = Attribute(parameter: par5, host: 16, guest: 28);
    final attrOut3 = Attribute(parameter: par5, host: 19, guest: 18);

    // Угловые
    final attrCorner1 = Attribute(parameter: par6, host: 4, guest: 4);
    final attrCorner2 = Attribute(parameter: par6, host: 1, guest: 8);
    final attrCorner3 = Attribute(parameter: par6, host: 5, guest: 3);

    final attrSet1 = [
      attrGoal1,
      attrKick1,
      attrKickInTarget1,
      attrFoul1,
      attrOut1,
      attrCorner1
    ];

    final attrSet2 = [
      attrGoal2,
      attrKick2,
      attrKickInTarget2,
      attrFoul2,
      attrOut2,
      attrCorner2
    ];

    final attrSet3 = [
      attrGoal3,
      attrKick3,
      attrKickInTarget3,
      attrFoul3,
      attrCorner3
    ];

    final attrSet4 = [
      attrGoal2,
      attrKick1,
      attrKickInTarget3,
      attrFoul1,
      attrCorner2
    ];

    final match1 = Match(
      id: const Uuid().v1(),
      host: team1,
      guest: team2,
      attributes: attrSet1,
      date: DateTime.now(),
      status: Status.inProcess,
    );

    final match2 = Match(
      id: const Uuid().v1(),
      host: team5,
      guest: team3,
      attributes: attrSet3,
      date: DateTime(2021, 6, 24, 18),
      status: Status.finished,
    );

    final match3 = Match(
      id: const Uuid().v1(),
      host: team3,
      guest: team1,
      attributes: attrSet3,
      date: DateTime(2021, 6, 24, 18),
      status: Status.notStarted,
    );

    final match4 = Match(
      id: const Uuid().v1(),
      host: team4,
      guest: team5,
      attributes: attrSet4,
      date: DateTime(2021, 5, 5, 13),
      status: Status.finished,
    );

    final match5 = Match(
      id: const Uuid().v1(),
      host: team1,
      guest: team5,
      attributes: attrSet3,
      date: DateTime(2021, 5, 14, 13),
      status: Status.finished,
    );

    final match6 = Match(
      id: const Uuid().v1(),
      host: team2,
      guest: team1,
      attributes: attrSet2,
      date: DateTime(2021, 5, 14, 13),
      status: Status.finished,
    );

    final match7 = Match(
      id: const Uuid().v1(),
      host: team2,
      guest: team5,
      attributes: attrSet4,
      date: DateTime(2021, 6, 15, 13),
      status: Status.finished,
    );

    final match8 = Match(
      id: const Uuid().v1(),
      host: team1,
      guest: team4,
      attributes: attrSet1,
      date: DateTime(2021, 9, 2, 13),
      status: Status.finished,
    );

    List<Match> matches = [
      match3,
      match8,
      match4,
      match5,
      match6,
      match1,
      match7,
      match2,
    ];

    final matchModels = matches.map((match) => MatchConverter.toModel(match));

    final matchesBox = Hive.box<MatchModel>(boxMatchStorage);

    if (matchesBox.isEmpty) {
      await matchesBox.clear();

      for (var element in matchModels) {
        await matchesBox.put(element.id, element);
      }

      // Добавляем активный матч;
      updateActiveMatchWithId(match1.id);
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
