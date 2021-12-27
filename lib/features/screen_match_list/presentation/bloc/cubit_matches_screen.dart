import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';

/// BLoC
class BlocMatchesScreen extends CubitCell<ViewState> {
  BlocMatchesScreen({
    required AppBloc app,
  }) : super(app, ContentState()) {
    _initialization();
  }

  _initialization() async {}

  navigateToMatch(String matchId) {}
}
