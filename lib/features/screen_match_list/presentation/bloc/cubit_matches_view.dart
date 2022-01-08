import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/match_interactor.dart';

/// States
class MatchesContentState extends ContentState {
  final List<Match> matches;

  MatchesContentState({required this.matches});
}

/// BLoC
class BlocMatchesView extends CubitCell<ViewState> {
  BlocMatchesView(
    this._matchInteractor, {
    required AppBloc app,
    required this.matchBloc,
  }) : super(app, LoadingState()) {
    _initialization();
  }

  final MatchBloc matchBloc;
  final MatchInteractor _matchInteractor;

  late List<Match> _matches;

  _initialization() async {
    final result = await _matchInteractor.getAll();

    if (result is DataTransporter<List<Match>>) {
      _matches = result.data;
      _matches = [];
      if (_matches.isNotEmpty) {
        emit(MatchesContentState(matches: _matches));
      } else {
        emit(EmptyState());
      }
    } else if (result is ErrorTransporter<List<Match>>) {
      emit(
        ErrorState(
          errorMessage: result.error.message ??
              "Произошла ошибка при загрузке списка матчей",
        ),
      );
    }
  }

  navigateToMatch(String matchId) {}
}
