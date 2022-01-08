import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'event.dart';

class TeamEditBloc extends Bloc<TeamEditEvent, TeamEditState> {
  TeamEditBloc({
    required this.teamsBloc,
    Team? team,
  }) : super(LoadingState()) {
    if (team == null) {
      this.team = Team.blank();
      title = null;
    } else {
      this.team = team;
      title = team.name;
    }
  }

  final TeamsBloc teamsBloc;
  late Team team;
  String? title;

  @override
  Stream<TeamEditState> mapEventToState(TeamEditEvent event) async* {
    try {
      // if (event is StartEvent) {
      //   yield TeamState(team: team, title: title);
      // } else if (event is UpdateNameEvent) {
      //   team.name = event.name;
      //   yield TeamState(team: team, title: title);
      // } else if (event is UpdateCityEvent) {
      //   team.city = event.city;
      //   yield TeamState(team: team, title: title);
      // } else if (event is UpdateColorEvent) {
      //   team.teamColor = event.color;
      //   yield TeamState(team: team, title: title);
      // } else if (event is UpdateLogoEvent) {
      //   team.logo = event.logo;
      //   yield TeamState(team: team, title: title);
      // } else if (event is UpdateSportEvent) {
      //   team.sport = event.sport;
      //   yield TeamState(team: team, title: title);
      // } else if (event is SaveTeamEvent) {
      //   updateTeam(team);
      // }
    } catch (e) {}
  }

  void updateTeam(Team team) {
    print("testUpdate: ${team.name}");
    teamsBloc.add(UpdateTeam(updatedTeam: team));
  }
}
