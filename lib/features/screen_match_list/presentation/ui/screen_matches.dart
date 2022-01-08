import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_screen.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/views/matches.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/views/start_new_match.dart';

class ScreenMatches extends WidgetBloc<BlocMatchesScreen> {
  const ScreenMatches({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, BlocMatchesScreen bloc) {
    return RefreshIndicator(
      onRefresh: bloc.refresh,
      color: ThemeHolder.of(context).main,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
                child: ViewStartNewMatch(),
              ),
              ViewMatches(
                horizontalPadding: 16,
                verticalPadding: 16,
                matchGap: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
