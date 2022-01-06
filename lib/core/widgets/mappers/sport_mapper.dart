import 'package:flutter/material.dart';
import 'package:sport_stats_live/features/configuration/domain/sport.dart';
import 'package:sport_stats_live/locales/locale_helper/l10n.dart';

extension SportX on Sport {
  String toName(BuildContext context) {
    switch (this) {
      case Sport.football:
        return HelperLocale.of(context).sportFootball;
      case Sport.cricket:
        return HelperLocale.of(context).sportCricket;
      case Sport.fieldHockey:
        return HelperLocale.of(context).sportIceHockey;
      case Sport.basketball:
        return HelperLocale.of(context).sportBasketball;
      case Sport.volleyball:
        return HelperLocale.of(context).sportVolleyball;
      case Sport.rugby:
        return HelperLocale.of(context).sportRugby;
      case Sport.baseball:
        return HelperLocale.of(context).sportBaseball;
      case Sport.iceHockey:
        return HelperLocale.of(context).sportIceHockey;
      case Sport.other:
        return HelperLocale.of(context).sportOther;
    }
  }
}
