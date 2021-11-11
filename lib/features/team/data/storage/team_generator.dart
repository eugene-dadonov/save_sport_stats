import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:uuid/uuid.dart';

class TeamGenerator {
  static List<Team> generateTeams() {
    return [
      Team(
          uid: const Uuid().v1(),
          name: "ФК Спирово",
          logo: Logo.shield1,
          teamColor: TeamColor.green,
          city: "Спирово"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Ржев",
          logo: Logo.round,
          teamColor: TeamColor.black,
          city: "Ржева"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Лихославль",
          logo: Logo.shield2,
          teamColor: TeamColor.yellow,
          city: "Лихославль"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Урожай",
          logo: Logo.shield2,
          teamColor: TeamColor.orange,
          city: "Мирный"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Торжок",
          logo: Logo.round,
          teamColor: TeamColor.blue,
          city: "Торжка"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Бологое",
          logo: Logo.round,
          teamColor: TeamColor.grey,
          city: "Бологое"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Звезда",
          logo: Logo.round,
          teamColor: TeamColor.yellow,
          city: "Осташков"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Редкино",
          logo: Logo.round,
          teamColor: TeamColor.red,
          city: "Редкино"),
      Team(
          uid: const Uuid().v1(),
          name: "ФК Волочанин",
          logo: Logo.shield3,
          teamColor: TeamColor.purple,
          city: "В. Волочек"),
    ];
  }
}
