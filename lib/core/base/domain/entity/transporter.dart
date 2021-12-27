import 'base_error.dart';

abstract class Transporter<T> {
  late final T? _data;
  late final BaseError? _error;

  Transporter({T? data, BaseError? error}) {
    _data = data;
    _error = error;
  }
}

class DataTransporter<T> extends Transporter<T> {
  T get data => _data!;

  DataTransporter({required T data}) : super(data: data, error: null);
}

class ErrorTransporter<T> extends Transporter<T> {
  BaseError get error => _error!;

  ErrorTransporter({required BaseError error})
      : super(data: null, error: error);
}
