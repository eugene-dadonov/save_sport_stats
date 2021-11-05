import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TeamBlock(team: match.host, score: 3),
            TeamBlock(team: match.guest, score: 1),
          ],
        ),
      ),
      onTap: () {
        callback?.call();
      },
      borderRadius: borderRadius,
      cardColor: Colors.white,
      splashColor: AppColors.background,
      shadowColor: AppColors.secondary.withOpacity(0.5),
    );
  }
}
