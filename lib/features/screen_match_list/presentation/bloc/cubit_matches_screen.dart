import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_view.dart';

/// BLoC
class BlocMatchesScreen extends CubitCell<ViewState> {
  BlocMatchesScreen({
    required AppBloc app,
    required this.blocMatchesView,
  }) : super(app, ContentState()) {
    _initialization();
  }

  final BlocMatchesView blocMatchesView;

  _initialization() async {}

  navigateToMatch(String matchId) {}
}
