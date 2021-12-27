import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/bloc/base_state.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/match_interactor.dart';

/// States
class MatchContentState extends ContentState {
  final List<Match> matches;

  MatchContentState({required this.matches});
}

/// BLoC
class BlocMatchList extends CubitCell<ViewState> {
  BlocMatchList(
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
    _matches = await _matchInteractor.getAll();
    if (_matches.isEmpty) {
      emit(EmptyState());
    }
    emit(MatchContentState(matches: _matches));
  }
}
