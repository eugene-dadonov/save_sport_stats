import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/core/widgets/title/title.dart';
import 'package:sport_stats_live/features/dialog_parameter_edit/presentation_edit/cubit/cubit_dialog_parameter_edit.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/presentation/view/new_configuration_view.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

final _titleKey = GlobalKey();
const defaultDialogHeight = 400.0;

class DialogParameterEdit extends WidgetBloc<CubitParametersDialog> {
  const DialogParameterEdit({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, CubitParametersDialog bloc) {
    return AppDialog(
      child: SizedBox(
        child: BlocBuilder<CubitParametersDialog, ViewState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(
                    color: ThemeHolder.of(context).main),
              );
            } else if (state is ParameterEditState) {
              return ParameterEditView(cubit: bloc, state: state);
            } else {
              final warningColor = ThemeHolder.of(context).warning;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    HelperLocale.of(context).errorWhileLoadingParameter,
                    textAlign: TextAlign.center,
                    style: ThemeHolder.of(context)
                        .textStyle
                        .h3(color: warningColor),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ParameterEditView extends StatelessWidget {
  final ParameterEditState state;
  final CubitParametersDialog cubit;

  const ParameterEditView({
    Key? key,
    required this.state,
    required this.cubit,
  }) : super(key: key);

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
              state.isNew
                  ? HelperLocale.of(context).titleNewParameter
                  : state.parameter.name,
              style: ThemeHolder.of(context).textStyle.h3(color: mainColor),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectionTitle(name: HelperLocale.of(context).titleName),
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
                text: state.parameter.name,
                maxLength: 30,
                validator: (value) {
                  return isNotNullOrEmpty(context, value);
                },
                onValueChanged: (value) {
                  cubit.updateTitle(value);
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
                        cubit.saveParameter();
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
