import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_home/domain/bloc/state.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.matches);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}
