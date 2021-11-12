import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/page/match_page.dart';
import 'package:sport_stats_live/features/screen_match_list/domain/bloc.dart';
import 'package:sport_stats_live/features/screen_match_list/domain/event.dart';
import 'package:sport_stats_live/features/screen_match_list/domain/state.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card/match_card.dart';

class MatchListPage extends StatefulWidget {
  const MatchListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchListPage> createState() => _MatchListPageState();

  static Route route(MatchBloc matchBloc) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: matchBloc,
        child: const MatchListPage(),
      ),
    );
  }
}

//TODO: Что-то страшное, нужно понять, как лучше это все организовать;
class _MatchListPageState extends State<MatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHolder.of(context).background1,
      body: BlocProvider(
        create: (BuildContext context) => MatchListBloc(
          matchRepository: context.read<MatchRepositoryImpl>(),
          matchBloc: context.read<MatchBloc>(),
        )..add(OnInitialization()),
        child: BlocConsumer<MatchListBloc, MatchListState>(
            listenWhen: (oldState, newState) => newState is OpenMatch,
            listener: (context, state) {
              if (state is OpenMatch) {
                Navigator.push(
                  context,
                  MatchRedesignedPage.route(
                    matchBloc: BlocProvider.of<MatchBloc>(context),
                    matchId: state.matchId,
                  ),
                );
              }
            },
            buildWhen: (oldState, newState) {
              return newState is Data ||
                  newState is EmptyList ||
                  newState is Error;
            },
            builder: (BuildContext context, MatchListState state) {
              if (state is Data) {
                return _buildScreen(context, state.matches, state.isSearch);
              } else {
                return Container(
                  color: Colors.red,
                );
              }
            }),
      ),
    );
  }

  Widget _buildScreen(
      BuildContext context, List<Match> matches, bool isSearch) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(context: context, isSearch: isSearch),
        _buildAppMatchButton(context),
        _buildMatchList(context, matches),
      ],
    );
  }

  Widget _buildAppBar({required BuildContext context, bool isSearch = false}) {
    if (isSearch) {
      return _buildSearchAppBar(context);
    } else {
      return _buildStandardAppBar(context);
    }
  }

  Widget _buildStandardAppBar(BuildContext context) {
    final textColor = ThemeHolder.of(context).main;

    return SliverAppBar(
      backgroundColor: ThemeHolder.of(context).background1,
      title: Text(
        'Список матчей',
        style: ThemeHolder.of(context).textStyle.h1(color: textColor),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<MatchListBloc>().add(OnSearchWithString(""));
          },
          icon: Icon(Icons.search_rounded, color: textColor),
        ),
      ],
    );
  }

  Widget _buildSearchAppBar(BuildContext context) {
    final hintColor = ThemeHolder.of(context).secondary1;
    final mainColor = ThemeHolder.of(context).main;

    return SliverAppBar(
      backgroundColor: ThemeHolder.of(context).background1,
      title: TextField(
          onChanged: (String query) {
            context.read<MatchListBloc>().add(OnSearchWithString(query));
          },
          decoration: InputDecoration(
            hintText: 'Команда или город',
            hintStyle: ThemeHolder.of(context).textStyle.b2(color: hintColor),
          ),
          style: ThemeHolder.of(context).textStyle.h3(color: hintColor)),
      actions: [
        IconButton(
          onPressed: () {
            context.read<MatchListBloc>().add(OnStopSearch());
          },
          icon: Icon(Icons.close_sharp, color: mainColor),
        ),
      ],
    );
  }

  Widget _buildAppMatchButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: StrokeFlatButton(
          text: 'Начать новый матч',
          onPress: () {},
          height: 100,
        ),
      ),
    );
  }

  Widget _buildMatchList(BuildContext context, List<Match> matches) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final Match match = matches[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: MatchCard(
              match: match,
              callback: () {
                context.read<MatchListBloc>().add(OnOpenMatch(match.id));
              },
            ),
          );
        },
        childCount: matches.length,
      ),
    );
  }
}
