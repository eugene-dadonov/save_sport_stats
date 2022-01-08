import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/team/domain/repository/team_repository.dart';
import 'package:sport_stats_live/features/team/domain/team_interactor.dart';

class TeamsContentState extends ContentState {
  final List<Team> teams;

  TeamsContentState({required this.teams});

  @override
  List<Object?> get props => [teams];
}

class CubitTeamsView extends CubitCell<ViewState> {
  CubitTeamsView({
    required AppBloc app,
    required this.teamInteractor,
  }) : super(app, LoadingState()) {
    initialize();
  }

  final TeamInteractor teamInteractor;
  List<Team> _teams = [];

  initialize() async {
    final result = await teamInteractor.getAll();

    if (result is DataTransporter<List<Team>>) {
      _teams = result.data;
      if (_teams.isNotEmpty) {
        print("TeamsContentState");
        emit(TeamsContentState(teams: _teams));
      } else {
        print("EmptyState");
        emit(EmptyState());
      }
    } else if (result is ErrorTransporter<List<Team>>) {
      print("ErrorState");

      emit(ErrorState(
          errorMessage:
              result.error.message ?? "Произошла ошибка при загрузке команд"));
    }
  }

  Future<void> refresh() async {
    emit(LoadingState());
    refresh();
  }
}
