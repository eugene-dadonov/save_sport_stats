// import 'dart:async';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
// import 'package:sport_stats_live/features/match/domain/bloc/state.dart';
// import 'package:sport_stats_live/features/match/domain/entity/match.dart';
// import 'package:sport_stats_live/features/match/domain/repository/match_repository.dart';
// import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/event.dart';
// import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/state.dart';
//
// class MatchListBloc extends Bloc<MatchListEvent, MatchListState> {
//   final MatchRepository matchRepository;
//   final MatchBloc matchBloc;
//
//   late List<Match> _matches;
//   bool isSearch = false;
//   late StreamSubscription _streamSubscription;
//
//   MatchListBloc({
//     required this.matchRepository,
//     required this.matchBloc,
//   }) : super(Loading()) {
//     _streamSubscription = matchBloc.stream.listen((event) {
//       if (event is MatchState) {
//         add(OnInitialization());
//       }
//     });
//   }
//
//   @override
//   Stream<MatchListState> mapEventToState(MatchListEvent event) async* {
//     try {
//       if (event is OnInitialization) {
//         print("Bloc: OnInitialization");
//         // _matches = await matchRepository.getAllMatches();
//         yield Data(matches: _matches);
//       } else if (event is OnOpenMatch) {
//         print("Bloc: OnOpenMatch");
//         yield OpenMatch(event.matchId);
//       } else if (event is OnSearch) {
//         print("Bloc: OnSearch");
//         isSearch = event.isSearchMode;
//         if (event is OnSearchWithString) {
//           print("Bloc: OnSearchWithString");
//
//           List<Match> filteredMatches = _matches.where((match) {
//             final queryFormatted = event.searchQuery.toLowerCase();
//             return match.host.name.toLowerCase().contains(queryFormatted) ||
//                 match.host.city.toLowerCase().contains(queryFormatted) ||
//                 match.guest.name.toLowerCase().contains(queryFormatted) ||
//                 match.guest.city.toLowerCase().contains(queryFormatted);
//           }).toList();
//           yield Data(matches: filteredMatches, isSearch: isSearch);
//         } else if (event is OnStopSearch) {
//           print("Bloc: OnStopSearch");
//           yield Data(matches: _matches);
//         }
//       } else {
//         print("Bloc: Strange");
//         yield EmptyList("Странная ситуация: нет такого события!");
//       }
//     } catch (e) {
//       print("Bloc: Error");
//       yield Error("Произошла ошибка");
//     }
//   }
//
//   @override
//   Future<void> close() async {
//     _streamSubscription.cancel();
//     return super.close();
//   }
// }
