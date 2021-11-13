import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/score_counter.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/screen_match/presentation_new/widget/double_button.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class ScoreTable extends StatelessWidget {
  const ScoreTable({
    Key? key,
    required this.scoreAttribute,
    required this.hostTeam,
    required this.guestTeam,
  }) : super(key: key);

  final Attribute scoreAttribute;
  final Team hostTeam;
  final Team guestTeam;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _HostHalf(
            score: scoreAttribute.host,
            team: hostTeam,
            hostStatus: HostStatus.host,
          ),
        ),
        Expanded(
          child: _HostHalf(
            team: guestTeam,
            score: scoreAttribute.guest,
            hostStatus: HostStatus.guest,
          ),
        ),
      ],
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
    final elementsColor = ThemeHolder.of(context).card;
    final teamColor = ThemeHolder.of(context).fromTeamColor(team.teamColor);
    const iconSize = 80.0;

    final bool isHost = hostStatus == HostStatus.host;

    final iconOffset = isHost
        ? const Offset(-iconSize * 0.45, 0)
        : const Offset(iconSize * 0.45, 0);

    final textAlign = isHost ? TextAlign.end : TextAlign.start;
    final scoreAlign = isHost ? Alignment.centerRight : Alignment.centerLeft;
    final buttonAlign = isHost ? Alignment.centerLeft : Alignment.centerRight;

    return Container(
      color: teamColor,
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
                  color: elementsColor,
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
                      .h1(color: elementsColor),
                ),
                Align(
                  alignment: scoreAlign,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: ScoreCounter(score: score, height: 60),
                  ),
                ),
                Align(
                  alignment: buttonAlign,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: AttributeButton(
                      color: elementsColor,
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
