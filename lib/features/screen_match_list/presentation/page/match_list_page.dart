import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/widgets/stroke_flat_button/stroke_flat_button.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/presentation/pages/match_page.dart';
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
}

class _MatchListPageState extends State<MatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (BuildContext context) =>
            MatchListBloc(matchRepository: context.read<MatchRepositoryImpl>())
              ..add(OnInitialization()),
        child: BlocConsumer<MatchListBloc, MatchListState>(
            listenWhen: (oldState, newState) => newState is OpenMatch,
            listener: (context, state) {
              if (state is OpenMatch) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MatchPage(matchId: state.matchId)),
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
    return SliverAppBar(
      backgroundColor: AppColors.background,
      title: Text(
        'Список матчей',
        style: GoogleFonts.russoOne(
          fontSize: 18,
          color: AppColors.main,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<MatchListBloc>().add(OnSearchWithString(""));
          },
          icon: const Icon(Icons.search_rounded, color: AppColors.main),
        ),
      ],
    );
  }

  Widget _buildSearchAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      title: TextField(
          onChanged: (String query) {
            context.read<MatchListBloc>().add(OnSearchWithString(query));
          },
          decoration: InputDecoration(
            hintText: 'Команда или город',
            hintStyle: GoogleFonts.russoOne(
              color: AppColors.secondary,
              fontSize: 14,
            ),
          ),
          style: GoogleFonts.russoOne(fontSize: 14, color: AppColors.main)),
      actions: [
        IconButton(
          onPressed: () {
            context.read<MatchListBloc>().add(OnStopSearch());
          },
          icon: const Icon(Icons.close_sharp, color: AppColors.main),
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
