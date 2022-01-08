import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

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
  String? title;

  Future<void> initialize() async {
    emit(NewTeamState(team: team, title: title));
  }

  Future<void> refresh() async {
    await initialize();
  }
}
