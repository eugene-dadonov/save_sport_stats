import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/features/match/data/repository/match_repository.dart';
import 'package:sport_stats_live/features/match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/state.dart';
import 'package:sport_stats_live/features/screen_match/presentation/view/active_match_view.dart';

class MatchRedesignedPage extends StatefulWidget {
  final String? matchId;
  final bool openActiveMatch;

  const MatchRedesignedPage({
    Key? key,
    this.matchId,
    required this.openActiveMatch,
  }) : super(key: key);

  static Route route({
    required MatchBloc matchBloc,
    String? matchId,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: matchBloc,
        child: matchId == null
            ? MatchRedesignedPage._openActiveMatch()
            : MatchRedesignedPage._openMatch(matchId),
      ),
    );
  }

  MatchRedesignedPage._openMatch(String id)
      : matchId = id,
        openActiveMatch = false;

  MatchRedesignedPage._openActiveMatch()
      : matchId = null,
        openActiveMatch = true;

  @override
  State<MatchRedesignedPage> createState() => _MatchRedesignedPageState();
}

class _MatchRedesignedPageState extends State<MatchRedesignedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final event = widget.openActiveMatch
            ? OpenActiveMatchEvent()
            : OpenMatchEvent(matchId: widget.matchId ?? "");

        return MatchScreenBloc(
          matchRepository: context.read<MatchRepositoryImpl>(),
          matchBloc: context.read<MatchBloc>(),
        )..add(event);
      },
      child: BlocBuilder<MatchScreenBloc, MatchScreenState>(
          builder: (BuildContext context, MatchScreenState state) {
        if (state is OnMatch) {
          return ActiveMatchView(match: state.match);
        } else if (state is OnError) {
          return Center(child: Text(state.message));
        } else if (state is OnNoActiveMatch) {
          return const Center(child: Text("Нет активного матча!"));
        } else {
          return const Center(child: Text("Что-то странное"));
        }
      }),
    );
  }
}
