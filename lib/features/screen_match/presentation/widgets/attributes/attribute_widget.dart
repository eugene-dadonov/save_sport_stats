import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'double_button.dart';

class AttributeWidget extends StatefulWidget {
  const AttributeWidget({
    Key? key,
    required this.attribute,
    required this.host,
    required this.guest,
    required this.onMinusClicked,
    required this.onPlusClicked,
  }) : super(key: key);

  final Attribute attribute;
  final Team host;
  final Team guest;
  final OnDoubleButtonClicked onPlusClicked;
  final OnDoubleButtonClicked onMinusClicked;

  @override
  _AttributeWidgetState createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends State<AttributeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey<String>(widget.attribute.parameter.name),
      decoration: BoxDecoration(
          color: ThemeHolder.of(context).card,
          borderRadius: const BorderRadius.all(Radius.circular(7.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStats(
            widget.attribute,
            widget.host,
            widget.guest,
          ),
          _buildButtons(
            widget.attribute,
            widget.host,
            widget.guest,
          ),
        ],
      ),
    );
  }

  Widget _buildStats(Attribute parameter, Team teamHost, Team teamGuest) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
          child: AnimatedSwitcher(
            key: ValueKey<String>(DateTime.now().toString()),
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: _buildScoreText(
              parameter.host,
              ThemeHolder.of(context).fromTeamColor(teamHost.teamColor),
              TextAlign.start,
            ),
          ),
        ),
        Expanded(
            child: _buildChart(
          parameter,
          teamHost,
          teamGuest,
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 16, 4),
          child: AnimatedSwitcher(
            key: ValueKey<String>(parameter.parameter.name + "_guest"),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            duration: const Duration(milliseconds: 500),
            child: _buildScoreText(
              parameter.guest,
              ThemeHolder.of(context).fromTeamColor(teamHost.teamColor),
              TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChart(
    Attribute parameter,
    Team teamOne,
    Team teamTwo,
  ) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          _buildChartPart(
            parameter.host,
            ThemeHolder.of(context).fromTeamColor(teamOne.teamColor),
          ),
          Container(
            color: ThemeHolder.of(context).card,
            width: 2,
          ),
          _buildChartPart(
            parameter.guest,
            ThemeHolder.of(context).fromTeamColor(teamTwo.teamColor),
          )
        ],
      ),
    );
  }

  Widget _buildChartPart(int flex, Color color) {
    return Flexible(
        flex: flex,
        child: Container(
          color: color,
        ));
  }

  Widget _buildButtons(Attribute attribute, Team teamHost, Team teamGuest) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButtonForTeam(teamHost, attribute, HostStatus.host),
          Expanded(child: _buildTitle(attribute.parameter.name)),
          _buildButtonForTeam(teamGuest, attribute, HostStatus.guest),
        ],
      ),
    );
  }

  Widget _buildTitle(String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Text(
        name.toUpperCase(),
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: ThemeHolder.of(context)
            .textStyle
            .h2(color: ThemeHolder.of(context).main),
      ),
    );
  }

  Widget _buildButtonForTeam(
    Team team,
    Attribute attribute,
    HostStatus hostStatus,
  ) {
    return DoubleButton(
      color: ThemeHolder.of(context).fromTeamColor(team.teamColor),
      height: 30,
      width: 100,
      borderWidth: 2,
      plusClicked: () {
        widget.onPlusClicked(attribute.parameter.id, hostStatus, 1);
      },
      minusClicked: () {
        widget.onMinusClicked(attribute.parameter.id, hostStatus, -1);
      },
    );
  }

  Widget _buildScoreText(int score, Color color, TextAlign textAlign) {
    int width = 20;
    if (score < 10) {
      width = 30;
    } else if (score >= 10 && score < 100) {
      width = 50;
    } else if (score >= 100 && score < 1000) {
      width = 75;
    } else {
      width = 90;
    }

    return SizedBox(
      height: 40,
      width: width.toDouble(),
      child: Text(
        score.toString(),
        textAlign: textAlign,
        style: GoogleFonts.russoOne(fontSize: 36, color: color),
      ),
    );
  }
}
