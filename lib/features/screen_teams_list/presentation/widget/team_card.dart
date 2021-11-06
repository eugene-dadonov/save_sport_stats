import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/colors.dart';
import 'package:sport_stats_live/core/design/styles.dart';
import 'package:sport_stats_live/core/widgets/clickable_card/clickable_card.dart';
import 'package:sport_stats_live/core/widgets/logo/logo.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

import 'chamfer_clip_path.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getColorByTeamColor(team.teamColor);
    return ClickableCard(
      cardColor: AppColors.card,
      splashColor: AppColors.greyLight.withOpacity(0.1),
      shadowColor: AppColors.main.withOpacity(0.2),
      borderRadius: const BorderRadius.all(Radius.circular(radius)),
      onTap: () {},
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
                  color: AppColors.card,
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
                  Text(team.name, style: AppStyle.h1(color: color, size: 18)),
                  Text(team.city, style: AppStyle.h1(color: color, size: 14)),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              color: AppColors.main,
              splashRadius: 30,
              splashColor: AppColors.main.withOpacity(0.5),
              icon: const Icon(Icons.more_vert_sharp))
        ],
      ),
    );
  }

  static const double radius = 10;
  static const double height = 66;
}
