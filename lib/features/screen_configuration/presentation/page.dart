import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  static Widget view({
    required ConfigurationBloc configurationBloc,
    required ParameterBloc parameterBloc,
  }) {
    return BlocProvider.value(
      value: configurationBloc,
      child: BlocProvider.value(
        value: parameterBloc,
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
    );
  }
}
