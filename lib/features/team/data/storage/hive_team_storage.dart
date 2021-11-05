import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/features/team/data/converters/team_converter.dart';
import 'package:sport_stats_live/features/team/data/model/team_model.dart';
import 'package:sport_stats_live/features/team/data/storage/team_generator.dart';
import 'package:sport_stats_live/features/team/data/storage/team_storage.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/exception/team_exception.dart';

class HiveTeamStorage extends TeamStorage {
  static const boxTeamStorage = "boxTeamStorage";

  Future<void> init() async {
    Hive.registerAdapter<TeamModel>(TeamModelAdapter());
    await Hive.openBox<TeamModel>(boxTeamStorage);
  }

  Future<void> createDemoTeams() async {
    final teams = TeamGenerator.generateTeams();
    final teamsModels = teams.map((team) => TeamConverter.toModel(team));

    final teamBox = Hive.box<TeamModel>(boxTeamStorage);

    if (teamBox.isEmpty) {
      await teamBox.clear();

      for (var team in teamsModels) {
        await teamBox.put(team.id, team);
      }
    } else {
      print('TeamBox: Box already has ${teamBox.length} items');
    }
  }

  void showTeams() {
    final matchesBox = Hive.box<TeamModel>(boxTeamStorage);
    for (var team in matchesBox.values) {
      print("${team.id}-${team.name}");
    }
  }

  @override
  Future<Team> getTeam(String id) async {
    final box = Hive.box<TeamModel>(boxTeamStorage);
    final teamModel = box.get(id);
    if (teamModel == null) {
      throw NoSuchTeam();
    } else {
      return TeamConverter.fromModel(teamModel);
    }
  }

  @override
  Future<List<Team>> getTeams() async {
    final box = Hive.box<TeamModel>(boxTeamStorage);
    return box.values
        .map((teamModel) => TeamConverter.fromModel(teamModel))
        .toList();
  }

  @override
  Future<void> saveTeam(Team team) async {
    final teamModel = TeamConverter.toModel(team);
    final box = Hive.box<TeamModel>(boxTeamStorage);
    box.put(teamModel.id, teamModel);
  }
}
