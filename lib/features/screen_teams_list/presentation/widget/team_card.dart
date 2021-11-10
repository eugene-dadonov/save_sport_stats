import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'chamfer_clip_path.dart';

typedef TeamCallback = void Function(Team);
typedef IdCallback = void Function(String);

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    required this.team,
    this.onCardClick,
    this.onContextMenuClick,
  }) : super(key: key);

  final Team team;
  final TeamCallback? onCardClick;
  final IdCallback? onContextMenuClick;

  @override
  Widget build(BuildContext context) {
    final color = ThemeHolder.of(context).fromTeamColor(team.teamColor);
    final colorCard = ThemeHolder.of(context).card;

    return ClickableCard(
      cardColor: colorCard,
      splashColor: ThemeHolder.of(context).secondary2,
      shadowColor: ThemeHolder.of(context).cardShadow,
      borderRadius: const BorderRadius.all(Radius.circular(radius)),
      onTap: () {
        onCardClick?.call(team);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: ChamferClipPath(radius: 10),
            child: Container(
              width: height * 1.2,
              height: height,
              color: color,
              child: FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 0.9,
                alignment: Alignment.centerLeft,
                child: LogoIcon(
                  logo: team.logo,
                  height: 45,
                  width: 45,
                  color: colorCard,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
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
          ),
          IconButton(
              onPressed: () {
                onContextMenuClick?.call(team.uid);
              },
              color: ThemeHolder.of(context).secondary1,
              splashRadius: 22,
              splashColor: ThemeHolder.of(context).secondary1.withOpacity(0.2),
              highlightColor: ThemeHolder.of(context).secondary1.withOpacity(0.2),
              icon: const Icon(Icons.more_vert_sharp))
        ],
      ),
    );
  }

  static const double radius = 10;
  static const double height = 66;
}
