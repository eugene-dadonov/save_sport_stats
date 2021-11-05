import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/exception/exception.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc({required this.matchRepository}) : super(OnLoading());

  final MatchRepositoryImpl matchRepository;
  Match? lastMatch;

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    try {
      lastMatch = await getLastMatch();

      if (event is OnStart) {
        print("OnLoading");
        yield OnLoaded(lastMatch);

      } else if (event is OnNewMatch) {
        print("OnNewMatch");
        yield NavigateTo(PageItem.newMatch);

      } else if (event is OnMatchList) {
        print("OnMatchList");
        yield NavigateTo(PageItem.matchList);

      } else if (event is OnTheme) {
        print("OnTheme");
        yield NavigateTo(PageItem.theme);

      } else if (event is OnLastMatch) {

        print("OnLastMatch");
        yield NavigateTo(PageItem.lastMatch);

      }
    } catch (e) {
      print("BLOC ERROR");
    }
  }

  Future<Match?> getLastMatch() async {
    Match? lastMatch;
    try {
      lastMatch = await matchRepository.getActiveMatch();
    } on NoActiveMatch {
      lastMatch = null;
    }
    return lastMatch;
  }
}

enum PageItem {
  newMatch,
  matchList,
  lastMatch,
  theme,
}
