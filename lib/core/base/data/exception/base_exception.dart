class BaseException implements Exception {
  BaseException({required this.errorMessage}) : super();

  final String errorMessage;
}
