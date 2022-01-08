import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';

/// BLoC
class CubitSettings extends CubitCell<ContentState> {
  CubitSettings({required AppBloc app}) : super(app, ContentState());
}
