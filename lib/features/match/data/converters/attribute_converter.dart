import 'package:sport_stats_live/features/configuration/data/converter/parameter_converter.dart';
import 'package:sport_stats_live/features/match/data/storage/models/attribute_model.dart';
import 'package:sport_stats_live/features/match/domain/entity/attribute.dart';

class AttributeConverter {
  static Attribute fromModel(AttributeModel model) {
    return Attribute(
      parameter: ParameterConverter.fromModel(model.parameter),
      host: model.host,
      guest: model.guest,
    );
  }

  static AttributeModel toModel(Attribute attribute) {
    final parameterModel = ParameterConverter.toModel(attribute.parameter);

    return AttributeModel(
      parameter: parameterModel,
      host: attribute.host,
      guest: attribute.guest,
    );
  }
}
