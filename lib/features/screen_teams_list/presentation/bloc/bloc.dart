import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/state.dart' as team_state;
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

import 'event.dart';

class TeamsListBloc extends Bloc<TeamListEvent, TeamListState> {
  final TeamRepository teamRepository;
  final TeamsBloc teamsBloc;
  late StreamSubscription _streamSubscription;

  TeamsListBloc({
    required this.teamRepository,
    required this.teamsBloc,
  }) : super(ListState.loading()) {
    _streamSubscription = teamsBloc.stream.listen((event) {
      if (event is team_state.TeamsState) {
        add(Init());
      }
    });
  }

  @override
  Stream<TeamListState> mapEventToState(
      TeamListEvent event) async* {
    if (event is Init) {
      yield* _mapInitToState();
    } else if (event is OnOpenTeam) {
      print("Open team");
      yield OpenTeamState(team: event.team);
    } else if (event is OpenTeamContextMenu) {
      yield OpenTeamContextMenuState(event.id);
    } else if (event is OnNewTeam) {
      yield NewTeamState();
    }
  }

  Stream<TeamListState> _mapInitToState() async* {
    List<Team> teams = [];
    try {
      print("TeamsListBloc._mapInitToState_1");
      teams = await teamRepository.getTeams();
      if (teams.isEmpty) {
        print("TeamsListBloc._mapInitToState_2");
        yield ListState.empty(null);
      } else {
        print("TeamsListBloc._mapInitToState_3");
        yield ListState.success(teams);
      }
    } catch (e) {
      yield ListState.error(null);
    }
  }

  @override
  Future<void> close() async {
    _streamSubscription.cancel();
    return super.close();
  }
}
