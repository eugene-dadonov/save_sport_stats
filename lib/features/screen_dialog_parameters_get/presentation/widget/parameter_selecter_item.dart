import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/domain/model/parameter_to_return.dart';

typedef OnParameterSelectedCallback = void Function(bool, Parameter);

class ParameterSelectorItem extends StatelessWidget {
  const ParameterSelectorItem({
    Key? key,
    required this.parameter,
    required this.onParameterSelectedCallback,
  }) : super(key: key);

  final ParameterToReturn parameter;
  final OnParameterSelectedCallback? onParameterSelectedCallback;

  @override
  Widget build(BuildContext context) {
    final colorMain = parameter.isSelected
        ? ThemeHolder.of(context).secondary1
        : ThemeHolder.of(context).main;
    return CheckboxListTile(
      value: parameter.isAlreadyAdded,
      title: Text(
        parameter.parameter.name,
        style: ThemeHolder.of(context).textStyle.h3(color: colorMain),
      ),
      onChanged: (value) {
        onParameterSelectedCallback?.call(
          value ?? false,
          parameter.parameter,
        );
      },
      tristate: false,
      checkColor: ThemeHolder.of(context).card,
      activeColor: colorMain,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
