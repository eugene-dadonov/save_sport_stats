import 'dart:math';

import 'package:collection/src/iterable_extensions.dart';
import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/match_interactor.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class MatchContent extends ContentState {
  final Match match;

  MatchContent({
    required this.match,
  });

  @override
  List<Object?> get props => [match, Random().nextInt(100000)];
}

class BlocMatchScreen extends CubitCell<ViewState> {
  // final String matchId;
  final MatchInteractor _matchInteractor;

  BlocMatchScreen(
    this._matchInteractor, {
    required AppBloc app,
    // required this.matchId,
  }) : super(app, LoadingState()) {
    initialize();
  }

  late Match currentMatch;

  Future<void> refresh() async {
    initialize();
  }

  Future<void> initialize() async {
    // Transporter<Match> result = await _matchInteractor.getById(matchId);
    Transporter<Match> result = await _matchInteractor.getActiveMatch();
    if (result is DataTransporter<Match>) {
      currentMatch = result.data;
      _updateMatch();
    } else if (result is ErrorTransporter<Match>) {
      emit(ErrorState(errorMessage: "Матч не найден!"));
    }
  }

  void updateParameter({
    required String parameterId,
    required HostStatus hostStatus,
    required int delta,
  }) {
    try {
      Attribute? attribute =
          currentMatch.attributes.firstWhereOrNull((attribute) {
        return attribute.parameter.id == parameterId;
      });

      if (attribute != null) {
        attribute.update(hostStatus, delta);
        _matchInteractor.update(currentMatch);
        _updateMatch();
      } else {
        throw Exception("There is no parameter with such id!");
      }
    } catch (e) {
      throw Exception("There is no parameter with such id!");
    }
  }

  void updateScore({
    required HostStatus hostStatus,
    required int delta,
  }) {
    Attribute score = currentMatch.score;
    if (hostStatus == HostStatus.host) {
      score.changeHostOn(delta);
    } else {
      score.changeGuestOn(delta);
    }
    _matchInteractor.update(currentMatch);
    _updateMatch();
  }

  updateStatus() {}

  _updateMatch() {
    emit(MatchContent(match: currentMatch));
  }
}
