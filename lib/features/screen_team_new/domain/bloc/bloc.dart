import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';

class NewTeamBloc extends Bloc<NewTeamEvent, NewTeamState> {
  NewTeamBloc({
    required this.teamRepository,
  }) : super(OnLoading());

  final TeamRepository teamRepository;
  Team? team;

  @override
  Stream<NewTeamState> mapEventToState(NewTeamEvent event) async* {
    try {
      if (event is Start) {
        yield OnNewTeamLoaded(team);
      } else if (event is UpdateName) {

      }
    } catch (e) {}
  }
}
