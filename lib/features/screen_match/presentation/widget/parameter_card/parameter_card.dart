import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/bloc.dart';
import 'package:sport_stats_live/features/screen_match/domain/bloc/event.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import '../double_button.dart';

class AttributeCard extends StatelessWidget {
  const AttributeCard({
    Key? key,
    required this.attribute,
    required this.teamOne,
    required this.teamTwo,
  }) : super(key: key);

  final Attribute attribute;
  final Team teamOne;
  final Team teamTwo;

  @override
  Widget build(BuildContext context) {
    final hostColor = ThemeHolder.of(context).fromTeamColor(teamOne.teamColor);
    final guestColor = ThemeHolder.of(context).fromTeamColor(teamTwo.teamColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ThemeHolder.of(context).card,
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeHolder.of(context).cardShadow,
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          // Chart part
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: _CounterTitle(
                  key: ValueKey(attribute.host),
                  score: attribute.host,
                  color: hostColor,
                ),
              ),
              Expanded(
                child: _RoundedChart(
                  colorLeft: hostColor,
                  colorRight: guestColor,
                  attribute: attribute,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: _CounterTitle(score: attribute.guest, color: guestColor),
              ),
            ],
          ),

          // Button part
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 6),
            child: Row(
              children: [
                AttributeButton(
                  color: hostColor,
                  height: 40,
                  width: 100,
                  plusClicked: () {
                    BlocProvider.of<MatchScreenBloc>(context).add(
                      UpdateAttributeEvent(
                        parameterId: attribute.parameter.id,
                        hostStatus: HostStatus.host,
                        delta: 1,
                      ),
                    );
                  },
                  minusClicked: () {
                    BlocProvider.of<MatchScreenBloc>(context).add(
                      UpdateAttributeEvent(
                        parameterId: attribute.parameter.id,
                        hostStatus: HostStatus.host,
                        delta: -1,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Text(
                    attribute.parameter.name,
                    textAlign: TextAlign.center,
                    style: ThemeHolder.of(context)
                        .textStyle
                        .h1(color: ThemeHolder.of(context).main),
                  ),
                ),
                AttributeButton(
                  color: guestColor,
                  height: 40,
                  width: 100,
                  plusClicked: () {
                    BlocProvider.of<MatchScreenBloc>(context).add(
                      UpdateAttributeEvent(
                        parameterId: attribute.parameter.id,
                        hostStatus: HostStatus.guest,
                        delta: 1,
                      ),
                    );
                  },
                  minusClicked: () {
                    BlocProvider.of<MatchScreenBloc>(context).add(
                      UpdateAttributeEvent(
                        parameterId: attribute.parameter.id,
                        hostStatus: HostStatus.guest,
                        delta: -1,
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CounterTitle extends StatelessWidget {
  final Color color;
  final int score;

  const _CounterTitle({
    Key? key,
    required this.color,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Text(
        score.toString(),
        style: ThemeHolder.of(context).textStyle.attribute(color: color),
      ),
    );
  }
}

class _RoundedChart extends StatelessWidget {
  const _RoundedChart({
    Key? key,
    required this.attribute,
    required this.colorLeft,
    required this.colorRight,
  }) : super(key: key);

  final Attribute attribute;
  final Color colorLeft;
  final Color colorRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: ValueKey(attribute.host + attribute.guest),
      children: [
        _RoundedChartLine(
          color: colorLeft,
          score: attribute.host,
        ),
        _RoundedChartLine(
          color: colorRight,
          score: attribute.guest,
        ),
      ],
    );
  }
}

class _RoundedChartLine extends StatelessWidget {
  final Color color;
  final int score;

  const _RoundedChartLine({
    Key? key,
    required this.color,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: score,
      child: Container(
        height: 24,
        color: color,
      ),
    );
  }
}
