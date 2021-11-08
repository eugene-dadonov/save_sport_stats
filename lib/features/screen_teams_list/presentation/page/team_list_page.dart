import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/page/new_team_page.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/event.dart'
    as event;
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/empty_view.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/loading_view.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/team_list_view.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

class TeamsListPage extends StatelessWidget {
  const TeamsListPage({
    Key? key,
  }) : super(key: key);

  static Route route(TeamsBloc teamsBloc) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: teamsBloc,
        child: const TeamsListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (BuildContext context) {
          return TeamsListBloc(
            teamRepository: context.read<TeamRepositoryImpl>(),
            teamsBloc: context.read<TeamsBloc>(),
          )..add(event.Init());
        },
        child: BlocConsumer<TeamsListBloc, TeamListState>(
          buildWhen: (_, newState) => newState is TeamList,
          builder: (BuildContext context, state) {
            if (state is TeamList) {
              switch (state.status) {
                case TeamListStatus.loading:
                  return const LoadingTeamListView();
                case TeamListStatus.success:
                  return TeamListView(
                      teams: state.teams,
                      onNewTeamClicked: () {
                        context.read<TeamsListBloc>().add(event.OnNewTeam());
                      });
                case TeamListStatus.empty:
                  return EmptyTeamListView(onNewTeamClicked: () {
                    context.read<TeamsListBloc>().add(event.OnNewTeam());
                  });
                case TeamListStatus.error:
                  return Container(
                    color: Colors.red,
                  );
              }
            } else {
              return Container(
                color: Colors.black12,
              );
            }
          },
          listenWhen: (_, newState) {
            return newState is OnNewTeam;
          },
          listener: (BuildContext context, Object? state) {
            if (state is OnNewTeam) {
              Navigator.of(context).push(
                  NewTeamPage.route(teamsBloc: context.read<TeamsBloc>()));
            }
          },
        ),
      ),
    );
  }
}
