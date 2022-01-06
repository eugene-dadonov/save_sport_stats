import 'package:flutter/cupertino.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

extension MatchStatusX on Status {
  String toName(BuildContext context) {
    switch (this) {
      case Status.inProcess:
        return HelperLocale.of(context).statusInProgress;
      case Status.finished:
        return HelperLocale.of(context).statusFinished;
      case Status.notStarted:
        return HelperLocale.of(context).statusNotStarted;
      case Status.canceled:
        return HelperLocale.of(context).statusCancelled;
    }
  }
}
