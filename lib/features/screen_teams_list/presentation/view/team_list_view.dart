import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card_new.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({
    Key? key,
    required this.teams,
    required this.onNewTeamClicked,
    required this.onTeamClicked,
  }) : super(key: key);

  final List<Team> teams;
  final VoidCallback onNewTeamClicked;
  final TeamCallback onTeamClicked;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: StrokeFlatButton(
              text: AppLocalizations.of(context)!.buttonNewTeam,
              onPress: () {
                onNewTeamClicked.call();
              },
              height: 60,
              color: ThemeHolder.of(context).secondary1,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TeamCardNew(
                team: teams[index],
                onCardClick: onTeamClicked,
              ),
              childCount: teams.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12),
          ),
        ),
      ],
    );
  }
}
