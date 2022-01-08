import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_start_new_match_view.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

class ViewStartNewMatch extends WidgetBloc<BlocStartNewMatchView> {
  const ViewStartNewMatch({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, BlocStartNewMatchView bloc) {
    return BlocBuilder<BlocStartNewMatchView, ContentState>(
      builder: (_, state) {
        return StrokeFlatButton(
          text: HelperLocale.of(context).buttonNewMatch,
          onPress: () {},
          height: 100,
          color: ThemeHolder.of(context).secondary1,
        );
      },
    );
  }
}
