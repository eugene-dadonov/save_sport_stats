import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/state.dart';

class ConfigurationEditScreenBloc
    extends Bloc<ConfigurationEditScreenEvent, ConfigurationEditScreenState> {
  ConfigurationEditScreenBloc({
    required this.configurationBloc,
    required this.parameterBloc,
    this.configuration,
  }) : super(LoadingView());

  final ConfigurationBloc configurationBloc;
  final ParameterBloc parameterBloc;
  final Configuration? configuration;

  @override
  Stream<ConfigurationEditScreenState> mapEventToState(
      ConfigurationEditScreenEvent event) async* {

  }
}
