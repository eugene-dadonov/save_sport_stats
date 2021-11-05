import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository matchRepository;

  MatchBloc({required this.matchRepository}) : super(OnLoading());

  @override
  Stream<MatchState> mapEventToState(MatchEvent event) async* {
    // try {
    if (event is InitialEvent) {
      final matchId = event.matchId;
      if (matchId != null) {
        Match? match = await matchRepository.getMatchById(matchId);
        if (match != null) {
          yield OnMatch(match: await matchRepository.getActiveMatch());
        } else {
          yield OnError("Ошибка! Матч не найден!");
        }
      } else {
        yield OnMatch(match: await matchRepository.getActiveMatch());
      }
    } else if (event is OnParameterChangedEvent) {
      Match oldMatch = await matchRepository.getActiveMatch();

      Match updatedMatch = _updateParameterById(
        oldMatch,
        event.parameterId,
        event.hostStatus,
        event.delta,
      );

      matchRepository.updateMatch(updatedMatch);

      yield OnMatch(match: updatedMatch);
    }
    // } catch (e) {
    //   // Todo: Сделать кастомные ошибки;
    //   yield OnError(e.runtimeType.toString());
    // }
  }

  Match _updateParameterById(
    Match match,
    String parameterId,
    HostStatus hostStatus,
    int delta,
  ) {
    Attribute? neededParameter = match.attributes
        .firstWhereOrNull((attribute) => attribute.parameter.id == parameterId);
    if (neededParameter != null) {
      if (hostStatus == HostStatus.host) {
        neededParameter.changeHostOn(delta);
      } else if (hostStatus == HostStatus.guest) {
        neededParameter.changeGuestOn(delta);
      }

      return match;
    }

    throw Exception("There is no parameter with such name!");
  }
}
