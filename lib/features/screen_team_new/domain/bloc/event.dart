import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

abstract class TeamEditEvent {}

class StartEvent extends TeamEditEvent {}

class UpdateNameEvent extends TeamEditEvent {
  final String name;

  UpdateNameEvent(this.name);
}

class UpdateCityEvent extends TeamEditEvent {
  final String city;

  UpdateCityEvent(this.city);
}

class UpdateColorEvent extends TeamEditEvent {
  final TeamColor color;

  UpdateColorEvent(this.color);
}

class UpdateLogoEvent extends TeamEditEvent {
  final Logo logo;

  UpdateLogoEvent(this.logo);
}

class UpdateSportEvent extends TeamEditEvent {
  final Sport sport;

  UpdateSportEvent(this.sport);
}

class SaveTeamEvent extends TeamEditEvent {}
