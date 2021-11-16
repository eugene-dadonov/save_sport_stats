import 'package:sport_stats_live/features/configuration/domain/parameter.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class Attribute {
  final Parameter parameter;
  int host;
  int guest;

  Attribute({
    required this.parameter,
    this.host = 0,
    this.guest = 0,
  });

  void changeHostOn(int delta) {
    if (host + delta >= 0) {
      host = host + delta;
    }
  }

  void changeGuestOn(int delta) {
    if (guest + delta >= 0) {
      guest = guest + delta;
    }
  }

  void update(HostStatus hostStatus, int delta) {
    if (hostStatus == HostStatus.host) {
      changeHostOn(delta);
    } else if (hostStatus == HostStatus.guest) {
      changeGuestOn(delta);
    }
  }

  double getPercentOfHost() => host / (host + guest);

  double getPercentOfGuest() => guest / (host + guest);
}
