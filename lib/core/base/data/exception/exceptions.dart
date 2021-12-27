import 'package:sport_stats_live/core/base/data/exception/base_exception.dart';

class NoElementWithSuchId extends BaseException {
  NoElementWithSuchId({
    required String errorMessage,
  }) : super(errorMessage: errorMessage);

  static const String defaultErrorMessage =
      "Элемент не был сохранен или уже удален!";
}
