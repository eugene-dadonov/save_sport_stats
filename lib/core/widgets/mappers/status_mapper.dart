import 'package:flutter/cupertino.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension MatchStatusX on Status {
  String toName(BuildContext context) {
    switch (this) {
      case Status.inProcess:
        return AppLocalizations.of(context)!.statusInProgress;
      case Status.finished:
        return AppLocalizations.of(context)!.statusFinished;
      case Status.notStarted:
        return AppLocalizations.of(context)!.statusNotStarted;
      case Status.canceled:
        return AppLocalizations.of(context)!.statusCancelled;
    }
  }
}
