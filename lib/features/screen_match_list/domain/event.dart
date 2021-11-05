class MatchListEvent {}

class OnInitialization extends MatchListEvent {}

class OnOpenMatch extends MatchListEvent {
  final String matchId;

  OnOpenMatch(this.matchId);
}

/// Search Events
class OnSearch extends MatchListEvent {
  final bool isSearchMode;

  OnSearch(this.isSearchMode);
}

class OnSearchWithString extends OnSearch {
  final String searchQuery;

  OnSearchWithString(this.searchQuery) : super(true);
}

class OnStopSearch extends OnSearch {
  OnStopSearch() : super(false);
}
