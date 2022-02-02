import 'package:equatable/equatable.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:uuid/uuid.dart';

import 'parameter.dart';

class Configuration extends Equatable {
  final String id;
  final String name;
  final List<Parameter> parameters;
  final Sport sport;

  const Configuration({
    required this.id,
    required this.name,
    required this.parameters,
    required this.sport,
  });

  Configuration.newConfiguration({
    required this.name,
    required this.sport,
    required this.parameters,
  }) : id = const Uuid().v1();

  Configuration.blank()
      : id = const Uuid().v1(),
        name = "",
        sport = Sport.other,
        parameters = [];

  Configuration copyWith({
    String? name,
    String? city,
    Sport? sport,
    List<Parameter>? parameters,
  }) {
    return Configuration(
      id: id,
      name: name ?? this.name,
      sport: sport ?? this.sport,
      parameters: parameters ?? this.parameters,
    );
  }

  @override
  List<Object?> get props => [id, name, parameters, sport];
}
