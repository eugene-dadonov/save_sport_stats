import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';

class CubitTeamsScreen extends CubitCell<ContentState> {
  CubitTeamsScreen({
    required AppBloc app,
  }) : super(app, ContentState());

  Future<void> refresh() async {}
}
