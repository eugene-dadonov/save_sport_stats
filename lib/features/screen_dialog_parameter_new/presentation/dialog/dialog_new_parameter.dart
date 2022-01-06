import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_dialog_parameter_new/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_dialog_parameter_new/bloc/event.dart';
import 'package:sport_stats_live/features/screen_dialog_parameter_new/bloc/state.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

final _titleKey = GlobalKey();

String? isNotNullOrEmpty(BuildContext context, String? value) {
  if (value == null || value.length == 0) {
    return HelperLocale.of(context).errorFieldMustBeFilled;
  }
}

class ParameterEditDialog extends StatelessWidget {
  const ParameterEditDialog({
    Key? key,
  }) : super(key: key);

  static Widget view({
    required ParameterBloc parameterBloc,
    Parameter? parameter,
  }) {
    return BlocProvider.value(
      value: parameterBloc,
      child: BlocProvider<ParameterEditBloc>(
        create: (BuildContext context) {
          return ParameterEditBloc(
            parameterBloc: parameterBloc,
            parameter: parameter,
          )..add(Init());
        },
        child: const ParameterEditDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ParameterEditBloc, ParameterEditState>(
          builder: (context, state) {
        if (state is Loading) {
          return Center(
            child:
                CircularProgressIndicator(color: ThemeHolder.of(context).main),
          );
        } else if (state is ParameterLoaded) {
          return DialogView(
              parameter: state.parameter, isNewParameter: state.isNewParameter);
        } else {
          final warningColor = ThemeHolder.of(context).warning;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                HelperLocale.of(context).errorWhileLoadingParameter,
                textAlign: TextAlign.center,
                style:
                    ThemeHolder.of(context).textStyle.h3(color: warningColor),
              ),
            ),
          );
        }
      }),
    );
  }
}

class DialogView extends StatelessWidget {
  const DialogView(
      {Key? key, required this.parameter, required this.isNewParameter})
      : super(key: key);

  final Parameter parameter;
  final bool isNewParameter;

  @override
  Widget build(BuildContext context) {
    final mainColor = ThemeHolder.of(context).main;
    final secondaryColor = ThemeHolder.of(context).secondary2;
    final backgroundColor = ThemeHolder.of(context).background1;
    final warningColor = ThemeHolder.of(context).warning;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: ThemeHolder.of(context).card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              isNewParameter
                  ? HelperLocale.of(context).titleNewParameter
                  : parameter.name,
              style: ThemeHolder.of(context).textStyle.h3(color: mainColor),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _Title(
                name: HelperLocale.of(context).titleName,
              ),
            ),
            const SizedBox(height: 12),
            Form(
              key: _titleKey,
              child: InputView(
                fillColor: backgroundColor,
                textColor: mainColor,
                borderColor: mainColor,
                hintColor: secondaryColor,
                hint: HelperLocale.of(context).hintParameterName,
                text: parameter.name,
                maxLength: 30,
                validator: (value) {
                  return isNotNullOrEmpty(context, value);
                },
                onValueChanged: (value) {
                  BlocProvider.of<ParameterEditBloc>(context)
                      .add(UpdateTitle(title: value));
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: MenuButton(
                    title: HelperLocale.of(context).buttonSave,
                    onPress: () {
                      if ((_titleKey.currentState as FormState).validate()) {
                        BlocProvider.of<ParameterEditBloc>(context)
                            .add(SaveParameter());
                        Navigator.of(context).pop();
                      }
                    },
                    color: mainColor,
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    title: HelperLocale.of(context).buttonCancel,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    color: warningColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).secondary2;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2),
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: ThemeHolder.of(context).textStyle.t1(color: color),
      ),
    );
  }
}