import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sport_stats_live/core/base/bloc_widget/bloc_widget.dart';
import 'package:sport_stats_live/core/base/domain/bloc/base_state.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/screen_team_new/presentation/ui/screen_new_team.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/bloc/cubit_teams.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card_new.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

const double _defaultHeight = 200;

class ViewTeams extends WidgetBloc<CubitTeamsView> {
  const ViewTeams({
    Key? key,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.teamsGap,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double teamsGap;

  @override
  Widget buildUI(BuildContext context, CubitTeamsView bloc) {
    return BlocBuilder<CubitTeamsView, ViewState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const _LoadingView();
        } else if (state is TeamsContentState) {
          return _TeamListView(
            teams: state.teams,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            teamsGap: teamsGap,
          );
        } else if (state is EmptyState) {
          return _EmptyView(
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        } else if (state is ErrorState) {
          return _ErrorView(
            errorMessage: state.errorMessage,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        } else {
          return _ErrorView(
            errorMessage: "Неизвестная ошибка",
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
          );
        }
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: _defaultHeight,

      /// TODO: Заменить на нормальную загрузку
      child: CircularProgressIndicator(),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({
    Key? key,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward_sharp,
                color: ThemeHolder.of(context).secondary2,
                size: 40,
              ),
              const SizedBox(height: 20),
              Text(
                "У вас еще нет команд.\nДобавьте их скорее!",
                style: ThemeHolder.of(context)
                    .textStyle
                    .h3(color: ThemeHolder.of(context).secondary1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    Key? key,
    required this.errorMessage,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  }) : super(key: key);

  final String errorMessage;

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _defaultHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Center(
          child: Text(
            errorMessage,
            style: ThemeHolder.of(context).textStyle.h3(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _TeamListView extends StatelessWidget {
  final List<Team> teams;

  const _TeamListView({
    Key? key,
    required this.teams,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.teamsGap = 0.0,
  }) : super(key: key);

  final double horizontalPadding;
  final double verticalPadding;
  final double teamsGap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: teams.length,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      itemBuilder: (context, index) {
        return TeamCardNew(
          team: teams[index],
          onCardClick: (Team team) {
            openTeamEditDialog(context: context, team: team);
          },
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: teamsGap,
        mainAxisSpacing: teamsGap,
      ),
    );
  }

  Future<T?> openTeamEditDialog<T>({
    required BuildContext context,
    required Team team,
  }) {
    return showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      expand: true,
      builder: (BuildContext context) {
        return ScreenNewTeam(team: team);
      },
    );
  }
}
