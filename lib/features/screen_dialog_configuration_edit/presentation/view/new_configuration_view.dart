import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/edit_widgets/edit_input_view.dart';
import 'package:sport_stats_live/core/widgets/edit_widgets/edit_title.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/core/widgets/sport_selector/sport_selector_drop.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/delete_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_color_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/dialog/selector_logo_view.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/widgets/delete_button.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _formKey = GlobalKey();

String? isNotNullOrEmpty(BuildContext context, String? value) {
  if (value == null || value.length == 0) {
    return AppLocalizations.of(context)!.errorFieldMustBeFilled;
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
                title: AppLocalizations.of(context)!.titleSport,
              ),
            ),
            SliverToBoxAdapter(
              child: SportSelectorDropdown(
                  selectedSport: configuration.sport,
                  onSportChanged: (sport) {}),
            ),
            SliverToBoxAdapter(
              child: EditTitle(
                title: AppLocalizations.of(context)!.titleName,
              ),
            ),
            SliverToBoxAdapter(
              child: EditInputView(
                // TODO: Добавить новую строчку
                text: configuration.name,
                hint: AppLocalizations.of(context)!.titleNewConfiguration,
                onValueChanged: (String value) {},
                validator: (value) {
                  isNotNullOrEmpty.call(context, value);
                },
              ),
            ),
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
        ? AppLocalizations.of(context)!.titleNewConfiguration
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
