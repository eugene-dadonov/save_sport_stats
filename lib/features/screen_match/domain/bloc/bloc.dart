import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/exception/exception.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/state.dart';

class MatchScreenBloc extends Bloc<MatchScreenEvent, MatchScreenState> {
  final MatchRepository matchRepository;
  final MatchBloc matchBloc;

  MatchScreenBloc({
    required this.matchRepository,
    required this.matchBloc,
  }) : super(OnLoading());

  late Match currentMatch;

  @override
  Stream<MatchScreenState> mapEventToState(MatchScreenEvent event) async* {
    // try {
    //   if (event is OpenMatchEvent) {
    //     currentMatch = await matchRepository.getMatchById(event.matchId);
    //     yield OnMatch(match: currentMatch);
    //   } else if (event is OpenActiveMatchEvent) {
    //     currentMatch = await matchRepository.getActiveMatch();
    //     yield OnMatch(match: currentMatch);
    //   } else if (event is UpdateAttributeEvent) {
    //
    //     Match updatedMatch = _updateParameterById(
    //       match: currentMatch,
    //       parameterId: event.parameterId,
    //       hostStatus: event.hostStatus,
    //       delta: event.delta,
    //     );
    //
    //     matchBloc.add(UpdateMatch(updatedMatch));
    //     yield OnMatch(match: updatedMatch);
    //
    //   } else if (event is UpdateScoreEvent) {
    //     Match updatedMatch = _updateScore(
    //       match: currentMatch,
    //       hostStatus: event.hostStatus,
    //       delta: event.delta,
    //     );
    //
    //     matchBloc.add(UpdateMatch(updatedMatch));
    //     yield OnMatch(match: updatedMatch);
    //   } else if (event is UpdateStatusEvent) {
    //     Match updatedMatch = currentMatch.copyWith(status: event.status);
    //     matchBloc.add(UpdateMatch(updatedMatch));
    //     yield OnMatch(match: updatedMatch);
    //   }
    // } on NoSuchMatch {
    //   yield OnError("Ошибка! Матч не найден!");
    // } catch (e) {
    //   yield OnError(e.runtimeType.toString());
    // }
  }

  Match _updateParameterById({
    required Match match,
    required String parameterId,
    required HostStatus hostStatus,
    required int delta,
  }) {
    try {
      Attribute? attribute = match.attributes.firstWhereOrNull((attribute) {
        return attribute.parameter.id == parameterId;
      });

      if (attribute != null) {
        attribute.update(hostStatus, delta);
        return match;
      } else {
        throw Exception("There is no parameter with such id!");
      }
    } catch (e) {
      throw Exception("There is no parameter with such id!");
    }
  }

  Match _updateScore({
    required Match match,
    required HostStatus hostStatus,
    required int delta,
  }) {
    Attribute score = match.score;
    if (hostStatus == HostStatus.host) {
      score.changeHostOn(delta);
    } else {
      score.changeGuestOn(delta);
    }
    return match;
  }
}
