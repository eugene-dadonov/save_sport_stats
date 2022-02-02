import 'package:sport_stats_live/app/presentation/bloc/app_bloc.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_cubit.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/interactor_configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';

class ConfigurationEditState extends ContentState {
  final Configuration configuration;
  final String? title;

  ConfigurationEditState({
    required this.configuration,
    this.title,
  });

  @override
  List<Object?> get props => [configuration];
}

class CubitConfigurationEditScreen extends CubitCell<ViewState> {
  late Configuration configuration;
  final InteractorConfiguration interactor;

  CubitConfigurationEditScreen({
    required AppBloc app,
    required this.interactor,
    Configuration? configuration,
  }) : super(app, LoadingState()) {
    if (configuration == null) {
      this.configuration = Configuration.blank();
      title = null;
    } else {
      this.configuration = configuration;
      title = configuration.name;
    }

    initialize();
  }

  String? title;

  Future<void> initialize() async {
    emit(ConfigurationEditState(configuration: configuration, title: title));
  }

  Future<void> refresh() async {
    await initialize();
  }

  updateTeamSport(Sport sport) {
    if (configuration.sport != sport) {
      configuration = configuration.copyWith(sport: sport);
      refresh();
    }
  }

  updateName(String name) {
    if (configuration.name != name) {
      configuration = configuration.copyWith(name: name);
      refresh();
    }
  }

  addParameter(Parameter parameter) {
    if (!configuration.parameters.contains(parameter)) {
      configuration.parameters.add(parameter);
      refresh();
    }
  }

  removeParameter(Parameter parameter) {
    if (!configuration.parameters.contains(parameter)) {
      configuration.parameters.add(parameter);
      refresh();
    }
  }

  saveConfiguration() {
    interactor.save(configuration);
  }
}
