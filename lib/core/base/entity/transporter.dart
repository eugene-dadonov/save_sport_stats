import 'error.dart';

abstract class Transporter<T> {
  late final T? _data;
  late final ErrorBase? _error;

  Transporter({T? data, ErrorBase? error}) {
    _data = data;
    _error = error;
  }
}

class DataTransporter<T> extends Transporter<T> {
  T get data => _data!;

  DataTransporter({required T data}) : super(data: data, error: null);
}

class ErrorTransporter<T> extends Transporter<T> {
  ErrorBase get error => _error!;

  ErrorTransporter({required ErrorBase error})
      : super(data: null, error: error);
}
