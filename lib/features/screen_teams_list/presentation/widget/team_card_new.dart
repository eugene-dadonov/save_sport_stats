import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/features/screen_match_list/presentation/widget/match_card_new/sport_logo_icon.dart';
import 'package:sport_stats_live/features/screen_teams_list/presentation/widget/team_card.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamCardNew extends StatelessWidget {
  const TeamCardNew({
    Key? key,
    required this.team,
    required this.onCardClick,
    this.onContextMenuClick,
  }) : super(key: key);

  final Team team;
  final TeamCallback? onCardClick;
  final IdCallback? onContextMenuClick;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        ThemeHolder.of(context).cardForegroundColor(team.teamColor);

    final backgroundColor =
        ThemeHolder.of(context).fromTeamColor(team.teamColor);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: ThemeHolder.of(context).cardShadow,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: ThemeHolder.of(context).card.withOpacity(0.1),
          highlightColor: ThemeHolder.of(context).card.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () {
            onCardClick?.call(team);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SportLogoWidget(sport: team.sport),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LogoIcon(
                      logo: team.logo,
                      color: foregroundColor,
                      height: 60,
                      width: 60,
                    ),
                    Text(
                      team.name,
                      textAlign: TextAlign.center,
                      style: ThemeHolder.of(context)
                          .textStyle
                          .h2(color: foregroundColor),
                    ),
                    Text(
                      team.city,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: ThemeHolder.of(context)
                          .textStyle
                          .h4(color: foregroundColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
