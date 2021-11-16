import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/core/widgets/score_counter.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card_new/match_date_widget.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'match_status_widget.dart';
import 'sport_logo_icon.dart';

class MatchCardNew extends StatelessWidget {
  final Match match;
  final VoidCallback callback;

  const MatchCardNew({
    Key? key,
    required this.match,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hostColor =
        ThemeHolder.of(context).fromTeamColor(match.host.teamColor);
    final guestColor =
        ThemeHolder.of(context).fromTeamColor(match.guest.teamColor);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.5, 0],
          colors: [hostColor, guestColor],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: ThemeHolder.of(context).cardShadow,
              blurRadius: 6,
              spreadRadius: 1),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ThemeHolder.of(context).card.withOpacity(0.1),
          highlightColor: ThemeHolder.of(context).card.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: callback,
          child: _CardForeground(match: match),
        ),
      ),
    );
  }
}

class _CardForeground extends StatelessWidget {
  final Match match;

  const _CardForeground({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _MatchInfoPanel(match: match),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: _HalfCard(
                team: match.host,
                score: match.score.host,
                hostStatus: HostStatus.host,
              ),
            ),
            Expanded(
              flex: 1,
              child: _HalfCard(
                team: match.guest,
                score: match.score.guest,
                hostStatus: HostStatus.guest,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MatchInfoPanel extends StatelessWidget {
  final Match match;

  const _MatchInfoPanel({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateForegroundColor =
        ThemeHolder.of(context).cardForegroundColor(match.guest.teamColor);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: SportLogoWidget(sport: match.sport),
          ),
        ),
        Expanded(child: MatchStatusWidget(status: match.status)),
        Expanded(
          child: Align(
            child: MatchDateWidget(
              date: match.date,
              foregroundColor: dateForegroundColor,
            ),
            alignment: Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}

class _HalfCard extends StatelessWidget {
  final Team team;
  final int score;
  final HostStatus hostStatus;

  const _HalfCard({
    Key? key,
    required this.team,
    required this.hostStatus,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        ThemeHolder.of(context).cardForegroundColor(team.teamColor);
    final isHost = hostStatus == HostStatus.host;

    final textAlign = isHost ? TextAlign.end : TextAlign.start;
    final axisAlign = isHost ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            team.name,
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: textAlign,
            style: ThemeHolder.of(context).textStyle.h1(color: foregroundColor),
          ),
          Text(
            team.city,
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: textAlign,
            style: ThemeHolder.of(context).textStyle.h4(color: foregroundColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: Row(
              mainAxisAlignment: axisAlign,
              children: [
                if (!isHost)
                  ScoreCounter.small(
                    score: score,
                    foregroundColor: foregroundColor,
                  ),
                LogoIcon(
                  logo: team.logo,
                  color: foregroundColor,
                  height: 45,
                ),
                if (isHost)
                  ScoreCounter.small(
                    score: score,
                    foregroundColor: foregroundColor,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
