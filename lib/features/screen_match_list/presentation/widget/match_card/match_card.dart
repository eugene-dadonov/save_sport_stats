import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card/team_block.dart';

class MatchCard extends StatelessWidget {
  final Match match;
  final VoidCallback? callback;

  const MatchCard({
    Key? key,
    required this.match,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(7));
    return ClickableCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TeamView(team: match.host, score: match.score.host),
            TeamView(team: match.guest, score: match.score.guest),
          ],
        ),
      ),
      onTap: () {
        callback?.call();
      },
      borderRadius: borderRadius,
      cardColor: ThemeHolder.of(context).card,
      splashColor: ThemeHolder.of(context).background1,
      shadowColor: ThemeHolder.of(context).cardShadow,
    );
  }
}
