import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/page/team_edit_page.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/event.dart'
    as event;
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/empty_view.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/loading_view.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/view/team_list_view.dart';
import 'package:sport_stats_live/features/team/data/repository/team_repository_impl.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

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
          buildWhen: (_, newState) => newState is ListState,
          builder: (BuildContext context, state) {
            if (state is ListState) {
              switch (state.status) {
                case TeamListStatus.loading:
                  return const LoadingTeamListView();
                case TeamListStatus.success:
                  return TeamListView(
                      teams: state.teams,
                      onTeamClicked: (team) {
                        context
                            .read<TeamsListBloc>()
                            .add(event.OnOpenTeam(team));
                      },
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
            return newState is NewTeamState || newState is OpenTeamState;
          },
          listener: (BuildContext context, Object? state) {
            if (state is OpenTeamState) {
              openTeamEditDialog(context: context, team: state.team);
            } else if (state is NewTeamState) {
              openTeamEditDialog(context: context, team: null);
            }
          },
        ),
      ),
    );
  }

  Future<T?> openTeamEditDialog<T>(
      {required BuildContext context, Team? team}) {
    return showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      expand: true,
      builder: (BuildContext context) {
        return TeamEditPage.page(
            teamsBloc: context.read<TeamsBloc>(), team: team);
      },
    );
  }
}
