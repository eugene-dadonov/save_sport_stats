import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/model/parameter_to_return.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/presentation/widget/parameter_selecter_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParameterDialogContentView extends StatelessWidget {
  const ParameterDialogContentView({
    Key? key,
    required this.parameters,
  }) : super(key: key);

  final List<ParameterToReturn> parameters;

  @override
  Widget build(BuildContext context) {
    final colorMain = ThemeHolder.of(context).main;
    final colorShadow = ThemeHolder.of(context).cardShadow;
    return Container(
      decoration: BoxDecoration(
          color: ThemeHolder.of(context).card,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: ThemeHolder.of(context).card,
              boxShadow: [BoxShadow(color: colorShadow, blurRadius: 10)],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.titleParameters,
                style: ThemeHolder.of(context).textStyle.h2(color: colorMain),
              ),
            ),
          ),
          Expanded(
            child: ParameterList(
              parameters: parameters,
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: ThemeHolder.of(context).card,
              boxShadow: [BoxShadow(color: colorShadow, blurRadius: 10)],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: MenuButton(
                        onPress: () {
                          print("Back!");
                          Navigator.of(context).pop<List<Parameter>>([]);
                        },
                        color: ThemeHolder.of(context).warning,
                        title: AppLocalizations.of(context)!.buttonCancel,
                      ),
                    ),
                    Expanded(
                        child: MenuButton(
                      onPress: () {
                        BlocProvider.of<DialogParametersGetBloc>(context)
                            .add(ReturnParameters());
                      },
                      color: colorMain,
                      title: AppLocalizations.of(context)!.buttonSave,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParameterList extends StatelessWidget {
  const ParameterList({
    Key? key,
    required this.parameters,
  }) : super(key: key);

  final List<ParameterToReturn> parameters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: parameters.length,
      itemBuilder: (BuildContext context, int index) {
        final parameterToReturn = parameters[index];
        return ParameterSelectorItem(
          parameter: parameterToReturn,
          onParameterSelectedCallback: (isSelected, parameter) {
            if (!parameterToReturn.isAlreadyAdded) {
              if (isSelected) {
                BlocProvider.of<DialogParametersGetBloc>(context)
                    .add(AddParameter(parameter));
              } else {
                BlocProvider.of<DialogParametersGetBloc>(context)
                    .add(RemoveParameter(parameter));
              }
            }
          },
        );
      },
    );
  }
}
