import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/screen_configuration/domain/bloc/state.dart';
import 'event.dart';

class ConfigurationListBloc
    extends Bloc<ConfigurationListEvent, ConfigurationListState> {


  ConfigurationListBloc(ConfigurationListState initialState)
      : super(ConfigurationListState.loading());



  @override
  Stream<ConfigurationListState> mapEventToState(ConfigurationListEvent event) async* {
    if (event is OnStart) {

    }
  }
}
