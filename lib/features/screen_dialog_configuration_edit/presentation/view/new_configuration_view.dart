import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/edit_widgets/edit_input_view.dart';
import 'package:sport_stats_live/core/widgets/edit_widgets/edit_title.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/core/widgets/parameter_item/parameter_item.dart';
import 'package:sport_stats_live/core/widgets/sport_selector/sport_selector_drop.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/screen_dialog_parameters_get/presentation/dialog/dialog_parameters_get.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/delete_button.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

final _formKey = GlobalKey();

String? isNotNullOrEmpty(BuildContext context, String? value) {
  if (value == null || value.length == 0) {
    return HelperLocale.of(context).errorFieldMustBeFilled;
  }
}

class ConfigurationEditView extends StatelessWidget {
  const ConfigurationEditView({
    Key? key,
    required this.configuration,
    required this.isNewConfiguration,
  }) : super(key: key);

  final Configuration configuration;
  final bool isNewConfiguration;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _TopBar(
                configuration: configuration,
                isNewConfiguration: isNewConfiguration,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 16)),
            SliverToBoxAdapter(
              child: EditTitle(
                title: HelperLocale.of(context).titleSport,
              ),
            ),
            SliverToBoxAdapter(
              child: SportSelectorDropdown(
                  selectedSport: configuration.sport,
                  onSportChanged: (sport) {}),
            ),
            SliverToBoxAdapter(
              child: EditTitle(
                title: HelperLocale.of(context).titleName,
              ),
            ),
            SliverToBoxAdapter(
              child: EditInputView(
                // TODO: Добавить новую строчку
                text: configuration.name,
                hint: HelperLocale.of(context).titleNewConfiguration,
                onValueChanged: (String value) {},
                validator: (value) {
                  isNotNullOrEmpty.call(context, value);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: EditTitle(
                title: HelperLocale.of(context).titleParameters,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  for (var item in configuration.parameters)
                    ParameterItem(
                      parameter: item,
                    )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: MenuButton(
                title: 'добавить новые параметры',
                color: ThemeHolder.of(context).main,
                onPress: () {
                  print("Start");
                  showDialog(
                    context: context,
                    builder: (builderContext) {
                      final width = MediaQuery.of(context).size.height;
                      return AppDialog(
                        child: SizedBox(
                          width: width,
                          child: ParametersToReturn.view(
                              parameterBloc:
                                  BlocProvider.of<ParameterBloc>(context),
                              activeParameters: configuration.parameters),
                        ),
                      );
                    },
                  ).then((value) => print(value));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final Configuration configuration;
  final bool isNewConfiguration;

  const _TopBar({
    Key? key,
    required this.configuration,
    required this.isNewConfiguration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = isNewConfiguration
        ? HelperLocale.of(context).titleNewConfiguration
        : configuration.name;
    final colorMain = ThemeHolder.of(context).main;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!isNewConfiguration)
          const SizedBox(
            height: 45,
            width: 45,
          ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(title,
                textAlign: TextAlign.center,
                style: ThemeHolder.of(context).textStyle.h1(color: colorMain)),
          ),
        ),
        if (!isNewConfiguration)
          DeleteButton(
            onTap: () {
              // Delete Dialog;
            },
          ),
      ],
    );
  }
}
