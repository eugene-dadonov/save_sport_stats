import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/bottom_tab.dart';

class HomeState extends ViewState {
  final AppTab appTab;

  HomeState({required this.appTab});

  @override
  List<Object?> get props => [appTab];
}

class BlocHome extends CubitCell<HomeState> {
  BlocHome({
    required AppBloc app,
    required this.bottomTab,
  }) : super(app, HomeState(appTab: AppTab.matches));

  final BlocBottomTab bottomTab;

  switchTo(AppTab appTab) {
    emit(HomeState(appTab: appTab));
  }
}
