import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamsListBloc extends Bloc<TeamListEvent, TeamListState> {
  TeamsListBloc({
    required this.teamRepository,
  }) : super(OnLoading());

  final TeamRepository teamRepository;

  @override
  Stream<TeamListState> mapEventToState(TeamListEvent event) async* {
    try {
      if (event is OnStart) {
        yield OnTeams(teams: await teamRepository.getTeams());
      } else if (event is OnOpenTeam) {
        yield OnTeamClicked(id: event.id);
      }
    } catch (e) {
      yield OnError(message: 'Ошибка');
    }
  }
}
