class BaseError {
  final String? message;
  final int? code;

  final StackTrace? stack;

  BaseError({required this.message, this.stack, this.code});

  @override
  String toString() {
    return "${message ?? ""}${(code != null) ? ". Code: $code" : ""}";
  }
}
