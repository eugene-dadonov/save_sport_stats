import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension SportX on Sport {
  String toName(BuildContext context) {
    switch (this) {
      case Sport.football:
        return AppLocalizations.of(context)!.sportFootball;
      case Sport.cricket:
        return AppLocalizations.of(context)!.sportCricket;
      case Sport.fieldHockey:
        return AppLocalizations.of(context)!.sportIceHockey;
      case Sport.basketball:
        return AppLocalizations.of(context)!.sportBasketball;
      case Sport.volleyball:
        return AppLocalizations.of(context)!.sportVolleyball;
      case Sport.rugby:
        return AppLocalizations.of(context)!.sportRugby;
      case Sport.baseball:
        return AppLocalizations.of(context)!.sportBaseball;
      case Sport.iceHockey:
        return AppLocalizations.of(context)!.sportIceHockey;
      case Sport.other:
        return AppLocalizations.of(context)!.sportOther;
    }
  }
}
