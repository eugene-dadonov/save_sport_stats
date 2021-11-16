import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/team/data/storage/team_generator.dart';
import 'package:uuid/uuid.dart';

class MatchGenerator {
  static List<Match> createDemoMatches() {

    final teams = TeamGenerator.generateTeams();

    final par1 =
        Parameter(id: const Uuid().v1(), name: "Голы", isDeletable: false);
    final par2 = Parameter(id: const Uuid().v1(), name: "Удары");
    final par3 = Parameter(id: const Uuid().v1(), name: "Удары в створ");
    final par4 = Parameter(id: const Uuid().v1(), name: "Фолы");
    final par5 = Parameter(id: const Uuid().v1(), name: "Ауты");
    final par6 = Parameter(id: const Uuid().v1(), name: "Угловые");

    // Cчет
    final score1 = Attribute(parameter: par1, host: 3, guest: 1);
    final score2 = Attribute(parameter: par1, host: 1, guest: 1);
    final score3 = Attribute(parameter: par1, host: 2, guest: 4);

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
      attrKick1,
      attrKickInTarget1,
      attrFoul1,
      attrOut1,
      attrCorner1
    ];

    final attrSet2 = [
      attrKick2,
      attrKickInTarget2,
      attrFoul2,
      attrOut2,
      attrCorner2
    ];

    final attrSet3 = [attrKick3, attrKickInTarget3, attrFoul3, attrCorner3];

    final attrSet4 = [attrKick1, attrKickInTarget3, attrFoul1, attrCorner2];

    final match1 = Match(
        id: const Uuid().v1(),
        host: teams[0],
        guest: teams[1],
        score: score1,
        attributes: attrSet1,
        date: DateTime.now(),
        status: Status.inProcess,
        sport: Sport.football);

    final match2 = Match(
      id: const Uuid().v1(),
      host: teams[4],
      guest: teams[2],
      score: score3,
      attributes: attrSet3,
      date: DateTime(2021, 6, 24, 18),
      status: Status.finished,
      sport: Sport.iceHockey,
    );

    final match3 = Match(
      id: const Uuid().v1(),
      host: teams[1],
      guest: teams[6],
      score: score3,
      attributes: attrSet3,
      date: DateTime(2021, 6, 24, 18),
      status: Status.notStarted,
      sport: Sport.cricket,
    );

    final match4 = Match(
      id: const Uuid().v1(),
      host: teams[2],
      guest: teams[3],
      score: score1,
      attributes: attrSet4,
      date: DateTime(2021, 5, 5, 13),
      status: Status.finished,
      sport: Sport.rugby,
    );

    final match5 = Match(
      id: const Uuid().v1(),
      host: teams[4],
      guest: teams[2],
      score: score3,
      attributes: attrSet3,
      date: DateTime(2021, 5, 14, 13),
      status: Status.finished,
      sport: Sport.fieldHockey,
    );

    final match6 = Match(
      id: const Uuid().v1(),
      host: teams[5],
      guest: teams[7],
      score: score2,
      attributes: attrSet2,
      date: DateTime(2021, 5, 14, 13),
      status: Status.finished,
      sport: Sport.other,
    );

    final match7 = Match(
      id: const Uuid().v1(),
      host: teams[1],
      guest: teams[7],
      score: score1,
      attributes: attrSet4,
      date: DateTime(2021, 6, 15, 13),
      status: Status.finished,
      sport: Sport.cricket,
    );

    final match8 = Match(
      id: const Uuid().v1(),
      host: teams[5],
      guest: teams[4],
      score: score3,
      attributes: attrSet1,
      date: DateTime(2021, 9, 2, 13),
      status: Status.finished,
      sport: Sport.volleyball,
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

    return matches;
  }
}
