import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/score_counter.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/hero_tags.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'double_button.dart';

class ScoreTable extends StatelessWidget {
  const ScoreTable({
    Key? key,
    required this.match,
  }) : super(key: key);

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${HeroTags.background}${match.id}",
      child: Row(
        children: [
          Expanded(
            child: _HostHalf(
              score: match.score.host,
              team: match.host,
              hostStatus: HostStatus.host,
            ),
          ),
          Expanded(
            child: _HostHalf(
              team: match.guest,
              score: match.score.guest,
              hostStatus: HostStatus.guest,
            ),
          ),
        ],
      ),
    );
  }
}

class _HostHalf extends StatelessWidget {
  final Team team;
  final int score;
  final HostStatus hostStatus;

  const _HostHalf({
    Key? key,
    required this.team,
    required this.score,
    required this.hostStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        ThemeHolder.of(context).cardForegroundColor(team.teamColor);
    final backgroundColor =
        ThemeHolder.of(context).fromTeamColor(team.teamColor);
    const iconSize = 80.0;

    final bool isHost = hostStatus == HostStatus.host;

    final iconOffset = isHost
        ? const Offset(-iconSize * 0.45, 0)
        : const Offset(iconSize * 0.45, 0);

    final textAlign = isHost ? TextAlign.end : TextAlign.start;
    final scoreAlign = isHost ? Alignment.centerRight : Alignment.centerLeft;
    final buttonAlign = isHost ? Alignment.centerLeft : Alignment.centerRight;

    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          // Background;
          Align(
            alignment: buttonAlign,
            child: Transform.translate(
              offset: iconOffset,
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: LogoIcon(
                  logo: team.logo,
                  width: iconSize,
                  height: iconSize,
                  color: foregroundColor,
                ),
              ),
            ),
          ),
          // Foreground;
          Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 9, bottom: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  team.name,
                  textAlign: textAlign,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: ThemeHolder.of(context)
                      .textStyle
                      .h1(color: foregroundColor),
                ),
                Align(
                  alignment: scoreAlign,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: ScoreCounter(
                      score: score,
                      height: 60,
                      foregroundColor: foregroundColor,
                    ),
                  ),
                ),
                Align(
                  alignment: buttonAlign,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: AttributeButton(
                      color: foregroundColor,
                      height: 36,
                      width: 100,
                      borderWidth: 2,
                      plusClicked: () {
                        BlocProvider.of<MatchScreenBloc>(context).add(
                          UpdateScoreEvent(
                            hostStatus: hostStatus,
                            delta: 1,
                          ),
                        );
                      },
                      minusClicked: () {
                        BlocProvider.of<MatchScreenBloc>(context).add(
                          UpdateScoreEvent(
                            hostStatus: hostStatus,
                            delta: -1,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
