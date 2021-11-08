import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/event.dart'
    as team_list_event;
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart'
    as team_event;
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamsListBloc extends Bloc<team_list_event.TeamListEvent, TeamListState> {
  final TeamRepository teamRepository;
  final TeamsBloc teamsBloc;
  late StreamSubscription _streamSubscription;

  TeamsListBloc({
    required this.teamRepository,
    required this.teamsBloc,
  }) : super(TeamList.loading()) {
    _streamSubscription = teamsBloc.stream.listen((event) {
      if (event is team_event.NewTeam ||
          event is team_event.UpdateTeam ||
          event is team_event.DeleteTeam) {
        add(team_list_event.Init());
      }
    });
  }

  @override
  Stream<TeamListState> mapEventToState(
      team_list_event.TeamListEvent event) async* {
    if (event is team_list_event.Init) {
      yield* _mapInitToState();
    } else if (event is team_list_event.OnOpenTeam) {
      yield OpenTeam(id: event.id);
    } else if (event is team_list_event.OpenTeamContextMenu) {
      yield OpenTeamContextMenu(event.id);
    } else if (event is team_list_event.OnNewTeam) {
      yield OnNewTeam();
    }
  }

  Stream<TeamListState> _mapInitToState() async* {
    List<Team> teams = [];
    try {
      teams = await teamRepository.getTeams();
      if (teams.isEmpty) {
        yield TeamList.empty(null);
      } else {
        yield TeamList.success(teams);
      }
    } catch (e) {
      yield TeamList.error(null);
    }
  }

  @override
  Future<void> close() async {
    _streamSubscription.cancel();
    return super.close();
  }
}
