import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
          create: (BuildContext context) {
            return TeamsListBloc(
                teamRepository: context.read<TeamRepositoryImpl>())
              ..add(OnStart());
          },
          child: BlocConsumer<TeamsListBloc, TeamListState>(
            builder: (BuildContext context, state) {
              if (state is OnTeams) {
                return _buildTeamsScreen(context, state.teams);
              } else {
                return Container(
                  color: Colors.red,
                );
              }
            },
            listener: (BuildContext context, Object? state) {},
          )),
    );
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
