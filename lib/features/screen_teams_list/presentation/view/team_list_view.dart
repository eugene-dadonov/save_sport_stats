import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

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
    return _buildTeamsScreen(context, teams);
  }

  Widget _buildTeamsScreen(BuildContext context, List<Team> teams) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(context),
        _buildNewTeamButton(context),
        _buildTeamList(context, teams),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeHolder.of(context).background1,
      title: Text(
        "Список команд",
        style: AppStyle.h1(size: 18, color: ThemeHolder.of(context).main),
      ),
    );
  }

  Widget _buildNewTeamButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StrokeFlatButton(
          text: 'Добавить новую команду',
          onPress: () {
            onNewTeamClicked.call();
          },
          height: 60,
          color: ThemeHolder.of(context).main,
        ),
      ),
    );
  }

  Widget _buildTeamList(BuildContext context, List<Team> teams) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TeamCard(
            team: teams[index],
            onCardClick: onTeamClicked,
          ),
        ),
        childCount: teams.length,
      ),
    );
  }
}
