import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_team_new/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/view/new_team_view.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

class NewTeamPage extends StatelessWidget {
  const NewTeamPage({Key? key}) : super(key: key);

  static Widget route({required TeamsBloc teamsBloc}) {
    return BlocProvider.value(
      value: teamsBloc,
      child: BlocProvider(
        create: (BuildContext context) {
          return NewTeamBloc(
              teamRepository: context.read<TeamRepositoryImpl>());
        },
        child: NewTeamPage(),
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
      body: BlocListener<NewTeamBloc, NewTeamState>(
        listenWhen: (_, newState) => newState is OnTeamSaved,
        listener: (BuildContext context, state) {
          Navigator.of(context).pop();
        },
        child: const NewTeamView(),
      ),
    );
  }
}
