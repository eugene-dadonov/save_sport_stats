import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/team_interactor.dart';

class NewTeamState extends ContentState {
  final Team team;
  final String? title;

  NewTeamState({
    required this.team,
    this.title,
  });

  @override
  List<Object?> get props => [team];
}

class CubitNewTeamScreen extends CubitCell<ViewState> {
  CubitNewTeamScreen({
    required AppBloc app,
    required this.interactor,
    Team? team,
  }) : super(app, LoadingState()) {
    if (team == null) {
      this.team = Team.blank();
      title = null;
    } else {
      this.team = team;
      title = team.name;
    }

    initialize();
  }

  late Team team;
  final TeamInteractor interactor;

  String? title;

  Future<void> initialize() async {
    emit(NewTeamState(team: team, title: title));
  }

  Future<void> refresh() async {
    await initialize();
  }

  updateTeamSport(Sport sport) {
    if (team.sport != sport) {
      team = team.copyWith(sport: sport);
      refresh();
    }
  }

  updateTeamLogo(Logo logo) {
    if (team.logo != logo) {
      team = team.copyWith(logo: logo);
      refresh();
    }
  }

  updateTeamColor(TeamColor color) {
    if (team.teamColor != color) {
      team = team.copyWith(teamColor: color);
      refresh();
    }
  }

  updateName(String name) {
    if (team.name != name) {
      team = team.copyWith(name: name);
      refresh();
    }
  }

  updateCity(String city) {
    if (team.city != city) {
      team = team.copyWith(city: city);
      refresh();
    }
  }

  saveTeam() {
    interactor.update(team);
  }
}
