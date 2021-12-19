import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/theming/domain/presentation/app_theme.dart';
import 'package:sport_stats_live/core/widgets/menu_button.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    Key? key,
    required this.onAccept,
    required this.onDecline,
    required this.team,
  }) : super(key: key);

  final Team team;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          color: ThemeHolder.of(context).card,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                team.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: ThemeHolder.of(context).textStyle.h1(
                    color:
                        ThemeHolder.of(context).fromTeamColor(team.teamColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                AppLocalizations.of(context)!.deleteDialogMessage(team.name),
                textAlign: TextAlign.center,
                style: ThemeHolder.of(context).textStyle.h4(
                      color: ThemeHolder.of(context).main,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: MenuButton(
                      title: AppLocalizations.of(context)!.buttonCancel,
                      onPress: onDecline,
                      color: ThemeHolder.of(context).main,
                    ),
                  ),
                  Expanded(
                    child: MenuButton(
                      title: AppLocalizations.of(context)!.buttonDelete,
                      onPress: onAccept,
                      color: ThemeHolder.of(context).warning,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
