import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/event.dart'
    as cof_event;
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/state.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/event.dart'
    as par_event;
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/state.dart';
import 'package:sport_stats_live/features/screen_configuration/presentation/views/configuration_view.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  static Widget view({
    required ConfigurationBloc configurationBloc,
    required ParameterBloc parameterBloc,
  }) {
    return BlocProvider.value(
      value: configurationBloc..add(cof_event.Init()),
      child: BlocProvider.value(
        value: parameterBloc..add(par_event.Init()),
        child: const ConfigurationScreen(),
      ),
    );
  }

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      body: BlocBuilder<ParameterBloc, ParametersState>(
          builder: (context, parameterState) {
        return BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, configurationState) {
          if (configurationState.status == ConfigurationStatus.loading &&
              parameterState.status == ParametersStateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (configurationState.status == ConfigurationStatus.updated ||
              parameterState.status == ParametersStateStatus.updated) {
            return ConfigurationsListView(
              configurations: configurationState.configurations,
              parameters: parameterState.parameters,
              parametersMessage: parameterState.message,
              configurationsMessage: configurationState.message,
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Произошла критическая ошибка при загрузки всех параметров!",
                  textAlign: TextAlign.center,
                  style: ThemeHolder.of(context)
                      .textStyle
                      .h1(color: ThemeHolder.of(context).warning),
                ),
              ),
            );
          }
        });
      }),
    );
  }
}
