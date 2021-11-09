import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  TeamsBloc({required this.teamRepository}) : super(TeamsState.loading());

  final TeamRepository teamRepository;

  @override
  Stream<TeamsState> mapEventToState(TeamsEvent event) async* {
    if (event is Teams) {
      yield* _mapTeamsEventToTeamsState();
    } else if (event is NewTeam) {
      yield* _mapNewTeamToTeamsState(event.newTeam);
    } else if (event is UpdateTeam) {
      yield* _mapUpdateTeamToTeamsState(event.updatedTeam);
    } else if (event is DeleteTeam) {
      yield* _mapDeleteTeamToTeamsState(event.id);
    }
  }

  Stream<TeamsState> _mapTeamsEventToTeamsState() async* {
    yield* _getTeams();
  }

  Stream<TeamsState> _mapNewTeamToTeamsState(Team newTeam) async* {
    yield* handleAndUpdate(action: () => teamRepository.saveTeam(newTeam));
  }

  Stream<TeamsState> _mapUpdateTeamToTeamsState(Team updatedTeam) async* {
    yield* handleAndUpdate(action: () => teamRepository.saveTeam(updatedTeam));
  }

  Stream<TeamsState> _mapDeleteTeamToTeamsState(String id) async* {
    try {
      teamRepository.delete(id);
    } catch (e) {
      yield TeamsState.failed();
    } finally {
      yield* _getTeams();
    }
  }

  Stream<TeamsState> _getTeams() async* {
    List<Team> teams;
    try {
      teams = await teamRepository.getTeams();
      if (teams.isEmpty) {
        yield TeamsState.empty();
      } else {
        yield TeamsState.success(teams: teams);
      }
    } catch (e) {
      yield TeamsState.error();
    }
  }

  Stream<TeamsState> handleAndUpdate({
    required AsyncCallback action,
    String? message,
  }) async* {
    try {
      await action.call();
    } catch (e) {
      yield TeamsState.failed(message: message);
    } finally {
      yield* _getTeams();
    }
  }
}
