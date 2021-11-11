import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widgets/table/table_names.dart';
import 'package:sport_stats_live/features/screen_match/presentation/widgets/table/table_score.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({
    Key? key,
    required this.host,
    required this.guest,
    required this.hostScore,
    required this.guestScore,
  }) : super(key: key);

  final Team host;
  final Team guest;

  final int hostScore;
  final int guestScore;

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildNames(),
        _buildScore(),
      ],
    );
  }

  Widget _buildNames() => TableNames(
        teamOne: widget.host,
        teamTwo: widget.guest,
        spaceBetweenTeams: spaceBetweenTeams,
      );

  Widget _buildScore() => TableScore(
        teamOne: widget.host,
        teamOneScore: widget.hostScore,
        teamTwo: widget.guest,
        teamTwoScore: widget.guestScore,
        spaceBetweenTeams: spaceBetweenTeams,
      );

  static const double spaceBetweenTeams = 25.0;
}
