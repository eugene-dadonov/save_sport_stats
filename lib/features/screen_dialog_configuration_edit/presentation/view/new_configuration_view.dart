import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/app_theme_data.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/core/widgets/dialog/dialog.dart';
import 'package:sport_stats_live/core/widgets/input_view/input_layout.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/core/widgets/sport_selector/sport_selector_drop.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey,);
  }
}