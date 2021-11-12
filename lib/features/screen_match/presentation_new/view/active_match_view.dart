import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/match_status.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/parameter_card/parameter_card.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/table.dart';

class ActiveMatchView extends StatelessWidget {
  final Match match;

  const ActiveMatchView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchScreenBloc, MatchScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeHolder.of(context).background1,
          appBar: AppBar(
            centerTitle: true,
            title: const ActiveMatch(),
            backgroundColor: ThemeHolder.of(context).background1,
            elevation: 0,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ScoreTable(
                  hostTeam: match.host,
                  guestTeam: match.guest,
                  scoreAttribute: match.score,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 7)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 7),
                      child: AttributeCard(
                        attribute: match.attributes[index],
                        teamOne: match.host,
                        teamTwo: match.guest,
                      ),
                    );
                  },
                  childCount: match.attributes.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
