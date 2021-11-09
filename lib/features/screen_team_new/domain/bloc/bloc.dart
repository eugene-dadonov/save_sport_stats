import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamEditBloc extends Bloc<TeamEditEvent, TeamEditState> {
  TeamEditBloc({
    required this.teamsBloc,
    Team? team,
  }) : super(LoadingState()) {
    if (team == null) {
      this.team = Team.blank();
    } else {
      this.team = team;
    }
  }

  final TeamsBloc teamsBloc;
  late Team team;

  @override
  Stream<TeamEditState> mapEventToState(TeamEditEvent event) async* {
    print(event.toString());

    try {
      if (event is StartEvent) {
        yield TeamState(team);
      } else if (event is UpdateNameEvent) {

        team.name = event.name;
        yield TeamState(team);
      } else if (event is UpdateCityEvent) {

        team.city = event.city;
        yield TeamState(team);
      } else if (event is UpdateColorEvent) {

        team.teamColor = event.color;
        yield TeamState(team);
      } else if (event is UpdateLogoEvent) {

        team.logo = event.logo;
        yield TeamState(team);
      } else if (event is SaveTeamEvent) {

        testUpdate(team);
      }
    } catch (e) {}
  }

  void testUpdate(Team team) {
    print("testUpdate: ${team.name}");
    teamsBloc.add(UpdateTeam(updatedTeam: team));
  }
}
