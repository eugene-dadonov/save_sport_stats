import 'package:hive/hive.dart';

part 'team_shot_model.g.dart';

@HiveType(typeId: 5)
class TeamShotModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String teamColor;

  @HiveField(3)
  final String logo;

  @HiveField(4)
  final String city;

  TeamShotModel({
    required this.id,
    required this.name,
    required this.teamColor,
    required this.logo,
    required this.city,
  });
}
