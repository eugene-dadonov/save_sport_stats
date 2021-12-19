import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/presentation/view/view_content.dart';

String? isNotNullOrEmpty(BuildContext context, String? value) {
  if (value == null || value.length == 0) {
    return AppLocalizations.of(context)!.errorFieldMustBeFilled;
  }
}

class ParametersToReturn extends StatelessWidget {
  const ParametersToReturn({
    Key? key,
  }) : super(key: key);

  static Widget view({
    required ParameterBloc parameterBloc,
    required List<Parameter> activeParameters,
  }) {
    return BlocProvider.value(
      value: parameterBloc,
      child: BlocProvider<DialogParametersGetBloc>(
        create: (BuildContext context) {
          return DialogParametersGetBloc(
            parameterBloc: parameterBloc,
            selectedParameters: activeParameters,
          )..add(Init());
        },
        child: const ParametersToReturn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DialogParametersGetBloc, DialogParametersGetState>(
      listenWhen: (_, state) => state is ReturnParametersBack,
      listener: (_, state) {
        if (state is ReturnParametersBack) {
          print("ReturnParametersBack State: ${state.parameters.length}");
          Navigator.of(context).pop(state.parameters);
        }
      },
      builder: (context, state) {
        if (state is LoadingView) {
          return Center(
            child:
                CircularProgressIndicator(color: ThemeHolder.of(context).main),
          );
        } else if (state is ContentView) {
          return ParameterDialogContentView(
            parameters: state.parameters,
          );
        } else {
          final warningColor = ThemeHolder.of(context).warning;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)!.errorWhileLoadingParameter,
                textAlign: TextAlign.center,
                style:
                    ThemeHolder.of(context).textStyle.h3(color: warningColor),
              ),
            ),
          );
        }
      },
    );
  }
}
