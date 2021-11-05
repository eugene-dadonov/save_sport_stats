import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/bloc.dart';

abstract class MenuState {}

class OnLoading extends MenuState {}

class OnLoaded extends MenuState {
  Match? lastMatch;

  OnLoaded(this.lastMatch);
}

class NavigateTo extends MenuState {
  final PageItem route;

  NavigateTo(this.route);
}
