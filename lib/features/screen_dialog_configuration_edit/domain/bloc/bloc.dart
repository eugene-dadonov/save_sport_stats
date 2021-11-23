import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/state.dart';

class ConfigurationEditScreenBloc
    extends Bloc<ConfigurationEditScreenEvent, ConfigurationEditScreenState> {
  ConfigurationEditScreenBloc({
    required this.configurationBloc,
    required this.parameterBloc,
    Configuration? configuration,
  }) : super(LoadingView()) {
    if (configuration != null) {
      _configuration = configuration;
      isNewConfiguration = false;
    } else {
      _configuration = Configuration.newConfiguration(
        name: "",
        sport: Sport.other,
        parameters: [],
      );
      isNewConfiguration = true;
    }
  }

  final ConfigurationBloc configurationBloc;
  final ParameterBloc parameterBloc;
  late Configuration _configuration;
  bool isNewConfiguration = true;

  @override
  Stream<ConfigurationEditScreenState> mapEventToState(
      ConfigurationEditScreenEvent event) async* {
    if (event is Init) {
      yield ConfigurationView(
        configuration: _configuration,
        isNewConfiguration: isNewConfiguration,
      );
    }
  }
}
