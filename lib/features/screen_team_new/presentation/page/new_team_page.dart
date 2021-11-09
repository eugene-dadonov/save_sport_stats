import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/view/new_team_view.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class NewTeamPage extends StatelessWidget {
  const NewTeamPage({Key? key}) : super(key: key);

  static Widget page({required TeamsBloc teamsBloc, Team? team}) {
    return BlocProvider.value(
      value: teamsBloc,
      child: BlocProvider(
        create: (BuildContext context) {
          return NewTeamBloc(
            team: team,
            teamRepository: context.read<TeamRepositoryImpl>(),
          )..add(Start());
        },
        child: const NewTeamPage(),
      ),
    );
  }

  static Route route({required TeamsBloc teamsBloc, Team? team}) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: teamsBloc,
        child: NewTeamPage.page(teamsBloc: teamsBloc, team: team),
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
      body: BlocConsumer<NewTeamBloc, NewTeamState>(
        listenWhen: (_, newState) => newState is OnTeamSaved,
        listener: (BuildContext context, state) {
          Navigator.of(context).pop();
        },
        buildWhen: (oldState, newState) =>
            newState is OnTeamUpdated || newState is OnLoading,
        builder: (context, state) {
          if (state is OnLoading) {
            return Container(
              color: AppColors.main,
            );
          } else if (state is OnTeamUpdated) {
            return NewTeamView(team: state.team);
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
