import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

abstract class ConfigurationEditScreenEvent {}

class Init extends ConfigurationEditScreenEvent {}

class UpdateName extends ConfigurationEditScreenEvent {
  final String name;

  UpdateName(this.name);
}

class UpdateSport extends ConfigurationEditScreenEvent {
  final Sport sport;

  UpdateSport(this.sport);
}

class AddParameter extends ConfigurationEditScreenEvent {
  final Parameter parameter;

  AddParameter(this.parameter);
}

class RemoveParameter extends ConfigurationEditScreenEvent {
  final String id;

  RemoveParameter(this.id);
}
