import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TableNames extends StatelessWidget {
  const TableNames({
    Key? key,
    required this.teamOne,
    required this.teamTwo,
    this.spaceBetweenTeams = 20,
  }) : super(key: key);

  final Team teamOne;
  final Team teamTwo;
  final double spaceBetweenTeams;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: buildName(context, teamOne, TextAlign.end)),
        SizedBox(width: spaceBetweenTeams),
        Expanded(child: buildName(context, teamTwo, TextAlign.start)),
      ],
    );
  }

  Widget buildName(BuildContext context, Team team, TextAlign textAlign) {
    return Text(
      team.name,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: 2,
      style: GoogleFonts.russoOne(
        fontSize: 22,
        color: ThemeHolder.of(context).fromTeamColor(team.teamColor),
      ),
    );
  }
}
