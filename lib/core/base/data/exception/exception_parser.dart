import 'package:sport_stats_live/core/base/data/exception/exceptions.dart';
import 'package:sport_stats_live/core/base/domain/entity/base_error.dart';
import 'package:sport_stats_live/core/base/domain/entity/errors.dart';
import 'package:sport_stats_live/core/base/domain/entity/transporter.dart';

class ExceptionParser {
  static ErrorTransporter<T> handleToErrorTransporter<T>(
    Object e,
    StackTrace? stackTrace,
  ) {
    late BaseError error;
    if (e is NoElementWithSuchId) {
      error = ErrorNoElementWithThisId(errorMessage: e.errorMessage);
    } else {
      error = ErrorUnknown(errorMessage: ErrorUnknown.defaultErrorMessage);
    }

    return ErrorTransporter<T>(error: error);
  }
}
