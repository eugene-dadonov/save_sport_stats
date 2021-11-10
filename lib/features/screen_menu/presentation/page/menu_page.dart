import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/logos/logos.dart';
import 'package:sport_stats_live/core/theming/data/themes/themes.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/bloc.dart';
import 'package:sport_stats_live/core/theming/domain/bloc/event.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/presentation/pages/match_page.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/page/match_list_page.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card/match_card.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_menu/presentation/widget/menu_button.dart';
import 'package:sport_stats_live/features/screen_teams_list/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/page/team_list_page.dart';
import 'package:sport_stats_live/features/team/domain/bloc/bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      body: BlocProvider(
        create: (BuildContext context) {
          return MenuBloc(matchRepository: context.read<MatchRepositoryImpl>())
            ..add(OnStart());
        },
        child: BlocConsumer<MenuBloc, MenuState>(
          listenWhen: (previousState, newState) => newState is NavigateTo,
          listener: (BuildContext context, Object? state) {
            // Todo: не особо нравится такое решение. Лучше выделить это все в отдельный класс навигатор;
            if (state is NavigateTo) {
              if (state.route == PageItem.matchList) {
                Navigator.of(context)
                    .push(TeamsListPage.route(context.read<TeamsBloc>()));
              } else if (state.route == PageItem.lastMatch) {
                navigateTo(context, const MatchPage());
              } else if (state.route == PageItem.teamsList) {
                navigateTo(context, const TeamsListPage());
              }
            }
          },
          buildWhen: (_, newState) => newState is! NavigateTo,
          builder: (BuildContext context, state) {
            if (state is OnLoaded) {
              return _buildButtons(context, state.lastMatch);
            } else {
              return Container(
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context, Match? lastMatch) {
    const String assetName = 'assets/graphics/app_logo/app_logo.svg';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: SvgPicture.asset(assetName,
              color: ThemeHolder.of(context).teamsColor.redDark),
        ),
        const SizedBox(
          height: 80,
          width: 80,
        ),
        _MenuButtonWidget(
          title: 'Новый матч'.toUpperCase(),
          color: ThemeHolder.of(context).main,
          onTap: () {
            context.read<MenuBloc>().add(OnNewMatch());
          },
        ),
        _MenuButtonWidget(
          title: 'Все матчи'.toUpperCase(),
          color: ThemeHolder.of(context).main,
          onTap: () {
            context.read<MenuBloc>().add(OnMatchList());
          },
        ),
        _MenuButtonWidget(
          title: 'Список команд'.toUpperCase(),
          color: ThemeHolder.of(context).main,
          onTap: () {
            context.read<MenuBloc>().add(OnTeamsList());
          },
        ),
        _MenuButtonWidget(
          title: 'Сменить тему'.toUpperCase(),
          color: ThemeHolder.of(context).main,
          onTap: () {
            // TODO: Тестовый вариант
            final currentTheme = ThemeHolder.of(context).themeData;
            if (currentTheme == AppTheme.light) {
              context.read<ThemeBloc>().add(ThemeEvent(AppTheme.dark));
            } else {
              context.read<ThemeBloc>().add(ThemeEvent(AppTheme.light));
            }
          },
        ),
        if (lastMatch != null)
          _LastMatchButton(
            match: lastMatch,
          ),
      ],
    );
  }

  void navigateTo(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}

class _MenuButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  const _MenuButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: MenuButton(
        title: title.toUpperCase(),
        onPress: onTap,
        color: color,
      ),
    );
  }
}

class _LastMatchButton extends StatelessWidget {
  final Match match;

  const _LastMatchButton({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: MatchCard(
        match: match,
        callback: () {
          context.read<MenuBloc>().add(OnLastMatch());
        },
      ),
    );
    ;
  }
}
