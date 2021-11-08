import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({Key? key, required this.teams}) : super(key: key);

  final List<Team> teams;

  @override
  Widget build(BuildContext context) {
    return _buildTeamsScreen(context, teams);
  }

  Widget _buildTeamsScreen(BuildContext context, List<Team> teams) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildNewTeamButton(context),
        _buildTeamList(context, teams),
      ],
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      title: Text(
        "Список команд",
        style: AppStyle.h1(size: 18),
      ),
    );
  }

  Widget _buildNewTeamButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StrokeFlatButton(
          text: 'Добавить новую команду',
          onPress: () {},
          height: 60,
        ),
      ),
    );
  }

  Widget _buildTeamList(BuildContext context, List<Team> teams) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TeamCard(team: teams[index]),
        ),
        childCount: teams.length,
      ),
    );
  }
}
