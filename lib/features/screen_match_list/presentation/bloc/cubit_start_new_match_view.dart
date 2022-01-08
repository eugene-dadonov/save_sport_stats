import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/match_interactor.dart';

/// BLoC
class BlocStartNewMatchView extends CubitCell<ContentState> {
  BlocStartNewMatchView({
    required AppBloc app,
  }) : super(app, ContentState());

  navigateToNewMatch(String matchId) {}

  Future<void> refresh() async {
    ContentState();
  }
}
