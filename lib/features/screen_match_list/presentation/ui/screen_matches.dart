import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/bloc/cubit_matches_screen.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/ui/views/matches/matches.dart';

class ScreenMatches extends WidgetBloc<BlocMatchesScreen> {
  const ScreenMatches({Key? key}) : super(key: key);

  @override
  Widget buildUI(BuildContext context, BlocMatchesScreen bloc) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ViewMatches(),
          ),
        ],
      ),
    );
  }
}
