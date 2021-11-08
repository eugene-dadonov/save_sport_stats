import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/match/domain/bloc/state.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc({required this.matchRepository}) : super(MatchState.loading());

  final MatchRepository matchRepository;

  @override
  Stream<MatchState> mapEventToState(MatchEvent event) async* {
    if (event is Matches) {
      yield* _mapMatchesToMatchState();
    } else if (event is NewMatch) {
      yield* _mapNewMatchToMatchState(event.match);
    } else if (event is DeleteMatch) {
      yield* _mapDeleteMatchToMatchState(event.id);
    } else if (event is UpdateMatch) {
      yield* _mapUpdateMatchToMatchState(event.match);
    } else if (event is ActiveMatch) {
      yield* _mapActiveMatchToMatchState(event.id);
    }
  }

  Stream<MatchState> _mapMatchesToMatchState() async* {
    yield* _getMatches();
  }

  Stream<MatchState> _mapNewMatchToMatchState(Match newMatch) async* {
    matchRepository.updateMatch(newMatch);
    yield* _getMatches();
  }

  Stream<MatchState> _mapDeleteMatchToMatchState(String id) async* {
    matchRepository.deleteMatch(id);
    yield* _getMatches();
  }

  Stream<MatchState> _mapUpdateMatchToMatchState(Match updatedMatch) async* {
    matchRepository.updateMatch(updatedMatch);
    yield* _getMatches();
  }

  Stream<MatchState> _mapActiveMatchToMatchState(String id) async* {
    matchRepository.updateActiveMatchWithId(id);
    yield* _getMatches();
  }

  Stream<MatchState> _getMatches() async* {
    List<Match> matches = [];
    Match? activeMatch;
    try {
      matches = await matchRepository.getAllMatches();
      activeMatch = await matchRepository.getActiveMatch();
    } finally {
      if (matches.isEmpty) {
        yield MatchState.empty();
      } else {
        yield MatchState.success(matches: matches, activeMatch: activeMatch);
      }
    }
  }
}
