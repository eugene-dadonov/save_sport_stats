import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/view/new_team_view.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamEditPage extends StatelessWidget {
  const TeamEditPage({Key? key}) : super(key: key);

  static Widget page({required TeamsBloc teamsBloc, Team? team}) {
    return BlocProvider.value(
      value: teamsBloc,
      child: BlocProvider(
        create: (BuildContext context) {
          return TeamEditBloc(
            team: team,
            teamsBloc: teamsBloc,
          )..add(StartEvent());
        },
        child: const TeamEditPage(),
      ),
    );
  }

  static Route route({required TeamsBloc teamsBloc, Team? team}) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: teamsBloc,
        child: TeamEditPage.page(teamsBloc: teamsBloc, team: team),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.card,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        title: Text(
          "Новая команда".toUpperCase(),
          style: AppStyle.h1(size: 18),
        ),
      ),
      body: BlocConsumer<TeamEditBloc, TeamEditState>(
        listenWhen: (_, newState) => newState is TeamSavedState,
        listener: (BuildContext context, state) {
          Navigator.of(context).pop();
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Container(color: AppColors.orange);
          } else if (state is TeamState) {
            return TeamEditView(team: state.team);
          } else {
            return Container(
              color: AppColors.red,
            );
          }
        },
      ),
    );
  }
}
