import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/design/logos/icons.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/app_icon.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/app_tab.dart';
import 'package:sport_stats_live/features/screen_home/presentation/bloc/cubit_toolbar.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class ViewToolbar extends WidgetBloc<BlocToolbar>
    implements PreferredSizeWidget {
  const ViewToolbar({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, BlocToolbar bloc) {
    return BlocBuilder<BlocToolbar, AppTab>(builder: (_, state) {
      return StandardToolbar(appTab: state);
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class StandardToolbar extends StatelessWidget {
  const StandardToolbar({
    Key? key,
    required this.appTab,
  }) : super(key: key);

  final AppTab appTab;

  @override
  Widget build(BuildContext context) {
    final textColor = ThemeHolder.of(context).main;

    return AppBar(
      centerTitle: true,
      backgroundColor: ThemeHolder.of(context).card,
      elevation: 2,
      shadowColor: ThemeHolder.of(context).cardShadow,
      title: Text(
        getTitle(context, appTab),
        style: ThemeHolder.of(context).textStyle.h2(color: textColor),
      ),
      leading: const _AppLogo(),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: AppIcon(
        icon: AppIcons.logo,
        color: ThemeHolder.of(context).warning,
        height: 50,
      ),
    );
  }
}

String getTitle(BuildContext context, AppTab appTab) {
  switch (appTab) {
    case AppTab.matches:
      return HelperLocale.of(context).titleMatches;
    case AppTab.teams:
      return HelperLocale.of(context).titleTeams;
    case AppTab.configuration:
      return HelperLocale.of(context).titleParameters;
    case AppTab.settings:
      return HelperLocale.of(context).titleSettings;
  }
}
