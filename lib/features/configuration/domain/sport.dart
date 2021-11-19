import 'package:flutter/material.dart';
import 'package:sport_stats_live/core/design/logos/sport_logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Sport {
  football,
  cricket,
  fieldHockey,
  basketball,
  volleyball,
  rugby,
  baseball,
  iceHockey,
  other,
}

extension SportLogoExtension on Sport {
  SportLogo toSportLogo() {
    switch (this) {
      case Sport.football:
        return SportLogo.football;
      case Sport.cricket:
        return SportLogo.cricket;
      case Sport.fieldHockey:
        return SportLogo.fieldHockey;
      case Sport.basketball:
        return SportLogo.basketball;
      case Sport.volleyball:
        return SportLogo.volleyball;
      case Sport.rugby:
        return SportLogo.rugby;
      case Sport.baseball:
        return SportLogo.baseball;
      case Sport.iceHockey:
        return SportLogo.iceHockey;
      case Sport.other:
        return SportLogo.other;
    }
  }

  String toSportName(BuildContext context) {
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
