import 'package:sport_stats_live/core/base/domain/entity/base_error.dart';

class ErrorNoElementWithThisId extends BaseError {
  ErrorNoElementWithThisId({
    required String errorMessage,
    StackTrace? stackTrace,
  }) : super(message: errorMessage, stack: stackTrace);

  static const String defaultErrorMessage =
      "Элемент не был сохранен или уже удален!";
}

class ErrorUnknown extends BaseError {
  ErrorUnknown({
    required String errorMessage,
    StackTrace? stackTrace,
  }) : super(message: errorMessage, stack: stackTrace);

  static const String defaultErrorMessage = "Неизвестная ошибка";
}
