import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamView extends StatelessWidget {
  final Team team;
  final int score;

  const TeamView({
    Key? key,
    required this.team,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).fromTeamColor(team.teamColor);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          LogoIcon(
              logo: team.logo,
              width: 45,
              height: 45,
              color: color,
            ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.name,
                  style: ThemeHolder.of(context).textStyle.h2(color: color),
                ),
                Text(
                  team.city,
                  style: ThemeHolder.of(context).textStyle.h4(color: color),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              score.toString(),
              style: GoogleFonts.russoOne(color: color, fontSize: 36),
            ),
          ),
        ],
      ),
    );
  }
}
