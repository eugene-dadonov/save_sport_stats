import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/presentation/view/new_configuration_view.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/view/new_team_view.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class ConfigurationEditPage extends StatelessWidget {
  const ConfigurationEditPage({Key? key}) : super(key: key);

  static Widget page({
    Configuration? configuration,
    required ConfigurationBloc configurationBloc,
    required ParameterBloc parameterBloc,
  }) {
    return BlocProvider.value(
      value: configurationBloc,
      child: BlocProvider.value(
        value: parameterBloc,
        child: BlocProvider(
          create: (BuildContext context) {
            return ConfigurationEditScreenBloc(
              configuration: configuration,
              configurationBloc: configurationBloc,
              parameterBloc: parameterBloc,
            )..add(Init());
          },
          child: const ConfigurationEditPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = ThemeHolder.of(context).card;

    return Scaffold(
      backgroundColor: cardColor,
      body: BlocConsumer<ConfigurationEditScreenBloc, ConfigurationEditScreenState>(
        listenWhen: (_, newState) => newState is TeamSavedState,
        listener: (BuildContext context, state) {
          Navigator.of(context).pop();
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Container(color: Colors.orange);
          } else if (state is TeamState) {
            return const ConfigurationEditView();
          } else {
            return Container(
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
