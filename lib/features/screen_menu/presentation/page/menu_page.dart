import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/presentation/pages/match_page.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/page/match_list_page.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card/match_card.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_menu/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_menu/presentation/widget/menu_button.dart';

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
      backgroundColor: AppColors.background,
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
                navigateTo(context, const MatchListPage());
              } else if (state.route == PageItem.lastMatch) {
                navigateTo(context, const MatchPage());
              }
            }
          },
          buildWhen: (_, newState) => newState is! NavigateTo,
          builder: (BuildContext context, state) {
            print("Builder: ${state.toString()}");

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildPreparedButton(
          title: 'Новый матч!'.toUpperCase(),
          color: AppColors.main,
          onTap: () {
            context.read<MenuBloc>().add(OnNewMatch());
          },
        ),
        _buildPreparedButton(
          title: 'Загрузить матч'.toUpperCase(),
          color: AppColors.main,
          onTap: () {
            context.read<MenuBloc>().add(OnMatchList());
          },
        ),
        _buildPreparedButton(
          title: 'Сменить тему'.toUpperCase(),
          color: AppColors.main,
          onTap: () {
            context.read<MenuBloc>().add(OnTheme());
          },
        ),
        if (lastMatch != null) _buildLastMatch(context, lastMatch)
      ],
    );
  }

  Widget _buildPreparedButton({
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: MenuButton(
        title: title.toUpperCase(),
        onPress: onTap,
        color: color,
      ),
    );
  }

  Widget _buildLastMatch(BuildContext context, Match lastMatch) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: MatchCard(
        match: lastMatch,
        callback: () {
          context.read<MenuBloc>().add(OnLastMatch());
        },
      ),
    );
  }

  void navigateTo(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
