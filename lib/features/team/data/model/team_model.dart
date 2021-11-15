import 'package:hive/hive.dart';

part 'team_model.g.dart';

@HiveType(typeId: 2)
class TeamModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String logo;

  @HiveField(3)
  final String sport;

  @HiveField(4)
  final String teamColor;

  @HiveField(5)
  final String city;

  TeamModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.teamColor,
    required this.city,
    required this.sport,
  });
}
