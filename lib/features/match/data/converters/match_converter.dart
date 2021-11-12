import 'package:collection/src/iterable_extensions.dart';
import 'package:sport_stats_live/features/match/data/converters/attribute_converter.dart';
import 'package:sport_stats_live/features/match/data/converters/team_shot_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/match_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/match.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';
import 'package:sport_stats_live/features/team/domain/entity/team.dart';

class MatchConverter {
  static Match fromModel(MatchModel matchModel) {
    Team host = TeamShotConverter.fromModel(matchModel.host);
    Team guest = TeamShotConverter.fromModel(matchModel.guest);
    List<Attribute> attributes = matchModel.attributes
        .map((param) => AttributeConverter.fromModel(param))
        .toList();

    Status? status = Status.values
        .firstWhereOrNull((status) => status.toString() == matchModel.status);

    Attribute score = AttributeConverter.fromModel(matchModel.score);

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
      status: status ?? Status.unknown,
      score: score,
    );
  }

  static MatchModel toModel(Match match) {
    final host = TeamShotConverter.toModel(match.host);
    final guest = TeamShotConverter.toModel(match.guest);
    final attributes = match.attributes
        .map((param) => AttributeConverter.toModel(param))
        .toList();

    final score = AttributeConverter.toModel(match.score);

    return MatchModel(
      id: match.id,
      host: host,
      guest: guest,
      attributes: attributes,
      dateTime: match.date.millisecondsSinceEpoch,
      status: match.status.toString(),
      score: score,
    );
  }
}
