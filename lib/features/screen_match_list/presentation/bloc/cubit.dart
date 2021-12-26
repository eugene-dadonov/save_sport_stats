import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/bloc/base_state.dart';

/// States

/// BLoC
class BlocMatchList extends CubitCell<ViewState> {
  BlocMatchList(AppBloc app) : super(app, LoadingState());
}
