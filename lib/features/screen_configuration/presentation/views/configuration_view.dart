import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/configuration/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/bloc/parameters/bloc.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/screen_configuration/presentation/widgets/configuration/card.dart';
import 'package:sport_stats_live/features/screen_configuration/presentation/widgets/parameter/parameters_card.dart';
import 'package:sport_stats_live/features/screen_dialog_configuration_edit/presentation/page/configuration_edit_page.dart';
import 'package:sport_stats_live/features/screen_dialog_parameter_new/presentation/dialog/dialog_new_parameter.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class ConfigurationsListView extends StatelessWidget {
  final List<Configuration> configurations;
  final String? configurationsMessage;
  final String? parametersMessage;
  final List<Parameter> parameters;

  const ConfigurationsListView({
    Key? key,
    required this.configurations,
    required this.parameters,
    this.configurationsMessage,
    this.parametersMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Title(
            title: HelperLocale.of(context).titleParameters,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: StrokeFlatButton(
              text: HelperLocale.of(context).titleNewConfiguration,
              onPress: () {
                openConfigurationEditDialog(
                  context: context,
                  configuration: null,
                );
              },
              height: 60,
              color: ThemeHolder.of(context).secondary1,
            ),
          ),
        ),
        if (configurations.isEmpty && configurationsMessage != null)
          SliverToBoxAdapter(
            child: _ErrorTitle(
              title:
                  "При загрузке наборов параметров произошла ошибка!\n$configurationsMessage",
            ),
          ),
        if (configurations.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ConfigurationCard(
                  configuration: configurations[index],
                  onTap: (value) {
                    openConfigurationEditDialog(
                      context: context,
                      configuration: value,
                    );
                  },
                ),
              );
            }, childCount: configurations.length),
          ),
        if (configurations.isEmpty && configurationsMessage == null)
          SliverToBoxAdapter(
              child: _EmptyViewTitle(
                  title: configurationsMessage ??
                      HelperLocale.of(context).messageNoConfigurations)),

        // // Параметры;
        SliverToBoxAdapter(
          child: _Title(
            title: HelperLocale.of(context).titleParameters,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: StrokeFlatButton(
              text: HelperLocale.of(context).titleNewParameter,
              onPress: () {
                showParameterDialog(context, null);
              },
              height: 60,
              color: ThemeHolder.of(context).secondary1,
            ),
          ),
        ),
        if (parameters.isEmpty && parametersMessage != null)
          SliverToBoxAdapter(
            child: _ErrorTitle(
              title:
                  "При загрузке параметров произошла ошибка!\n$parametersMessage",
            ),
          ),
        if (parameters.isNotEmpty)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                parameters
                    .map((e) => ParameterCard(
                          parameter: e,
                          onTap: (Parameter value) {
                            showParameterDialog(context, value);
                          },
                        ))
                    .toList(),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
            ),
          ),

        if (parameters.isEmpty && parametersMessage == null)
          SliverToBoxAdapter(
              child: _EmptyViewTitle(
                  title: parametersMessage ??
                      HelperLocale.of(context).messageNoParameters)),
      ],
    );
  }

  Future<void> showParameterDialog(BuildContext context, Parameter? parameter) {
    return showDialog(
      context: context,
      builder: (builderContext) {
        final width = MediaQuery.of(context).size.height;
        return AppDialog(
          child: SizedBox(
            width: width,
            child: ParameterEditDialog.view(
              parameterBloc: BlocProvider.of<ParameterBloc>(context),
              parameter: parameter,
            ),
          ),
        );
      },
    );
  }

  Future<T?> openConfigurationEditDialog<T>({
    required BuildContext context,
    Configuration? configuration,
  }) {
    return showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      expand: true,
      builder: (BuildContext context) {
        return ConfigurationEditPage.page(
          configuration: configuration,
          parameterBloc: BlocProvider.of<ParameterBloc>(context),
          configurationBloc: BlocProvider.of<ConfigurationBloc>(context),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
      child: Text(
        title,
        style: ThemeHolder.of(context).textStyle.h2(
              color: ThemeHolder.of(context).main,
            ),
      ),
    );
  }
}

class _ErrorTitle extends StatelessWidget {
  final String title;

  const _ErrorTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 16, left: 16, bottom: 0),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: ThemeHolder.of(context)
              .textStyle
              .h4(color: ThemeHolder.of(context).warning),
        ),
      ),
    );
  }
}

class _EmptyViewTitle extends StatelessWidget {
  final String title;

  const _EmptyViewTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
        child: Text(
          title,
          style: ThemeHolder.of(context)
              .textStyle
              .h3(color: ThemeHolder.of(context).secondary2),
        ),
      ),
    );
  }
}
