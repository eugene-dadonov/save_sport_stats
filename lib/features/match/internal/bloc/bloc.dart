import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/bloc/base_cubit.dart';

class MatchState {}

class Updated extends MatchState {}

class Initial extends MatchState {}

class BlocMatch extends CubitCell<MatchState> {
  BlocMatch(AppBloc app) : super(app, Initial());


}
