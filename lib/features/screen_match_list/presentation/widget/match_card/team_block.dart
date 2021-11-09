import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class TeamView extends StatelessWidget {
  final Team team;
  final int score;

  Color get color => AppColors.getColorByTeamColor(team.teamColor);

  const TeamView({
    Key? key,
    required this.team,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Container(
                color: color,
                height: 30,
                width: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(team.name,
                      style: GoogleFonts.russoOne(
                          color: color, fontSize: 18)),
                  Text(team.city,
                      style: GoogleFonts.russoOne(
                          color: color, fontSize: 14)),
                ],
              ),
            ),
            Text(
              score.toString(),
              style: GoogleFonts.russoOne(color: color, fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }
}
