import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TableScore extends StatelessWidget {
  const TableScore({
    Key? key,
    required this.teamOne,
    required this.teamOneScore,
    required this.teamTwo,
    required this.teamTwoScore,
    this.spaceBetweenTeams = 20,
  }) : super(key: key);

  final Team teamOne;
  final int teamOneScore;
  final Team teamTwo;
  final int teamTwoScore;
  final double spaceBetweenTeams;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildScore(teamOne, teamOneScore, TextAlign.end)),
        SizedBox(width: spaceBetweenTeams),
        Expanded(child: buildScore(teamTwo, teamTwoScore, TextAlign.start)),
      ],
    );
  }

  Widget buildScore(Team team, int score, TextAlign textAlign) {
    return Text(score.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: textAlign,
        style: GoogleFonts.russoOne(
          fontSize: 55,
          // TODO: Сделать выбор цвета от enum;
          color: AppColors.getColorByTeamColor(team.teamColor),
        ));
  }
}
