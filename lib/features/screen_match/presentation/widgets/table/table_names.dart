import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';

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
        Expanded(child: buildName(teamOne, TextAlign.end)),
        SizedBox(width: spaceBetweenTeams),
        Expanded(child: buildName(teamTwo, TextAlign.start)),
      ],
    );
  }

  Widget buildName(Team team, TextAlign textAlign) {
    return Text(team.name,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          maxLines: 2,
          style: GoogleFonts.russoOne(
            fontSize: 22,
            // TODO: Сделать выбор цвета от enum;
            color: AppColors.getColorByTeamColor(team.teamColor),
          ),
    );
  }
}
