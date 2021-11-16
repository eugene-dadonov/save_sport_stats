import 'package:sport_stats_live/core/design/logos/sport_logo.dart';

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
  unknown,
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
      case Sport.unknown:
        return SportLogo.unknown;
    }
  }

  String toSportName() {
    switch (this) {
      case Sport.football:
        return "Футбол";
      case Sport.cricket:
        return "Крикет";
      case Sport.fieldHockey:
        return "Хоккей на траве";
      case Sport.basketball:
        return "Баскетбол";
      case Sport.volleyball:
        return "Воллейбол";
      case Sport.rugby:
        return "Регби";
      case Sport.baseball:
        return "Бейсбол";
      case Sport.iceHockey:
        return "Хоккей на льду";
      case Sport.other:
        return "Другое";
      case Sport.unknown:
        return "Неизвестно";
    }
  }
}
