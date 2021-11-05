import 'package:collection/src/iterable_extensions.dart';
import 'package:sport_stats_live/features/match/data/converters/attribute_converter.dart';
import 'package:sport_stats_live/features/match/data/converters/team_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/match_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/match/domain/entity/team.dart';

class MatchConverter {
  static Match fromModel(MatchModel matchModel) {
    Team host = TeamConverter.fromModel(matchModel.host);
    Team guest = TeamConverter.fromModel(matchModel.guest);
    List<Attribute> attributes = matchModel.attributes
        .map((param) => AttributeConverter.fromModel(param))
        .toList();

    Status? status = Status.values
        .firstWhereOrNull((status) => status.toString() == matchModel.status);

    late DateTime dateTime;

    try {
      dateTime = DateTime.fromMillisecondsSinceEpoch(matchModel.dateTime);
    } catch (e) {
      dateTime = DateTime.now();
    }

    return Match(
        id: matchModel.id,
        host: host,
        guest: guest,
        attributes: attributes,
        date: dateTime,
        status: status ?? Status.unknown);
  }

  static MatchModel toModel(Match match) {
    final host = TeamConverter.toModel(match.host);
    final guest = TeamConverter.toModel(match.guest);
    final attributes = match.attributes
        .map((param) => AttributeConverter.toModel(param))
        .toList();

    return MatchModel(
      id: match.id,
      host: host,
      guest: guest,
      attributes: attributes,
      dateTime: match.date.millisecondsSinceEpoch,
      status: match.status.toString(),
    );
  }
}
