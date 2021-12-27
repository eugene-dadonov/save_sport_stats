class ErrorBase {
  final String? message;
  final int? code;

  final StackTrace? stack;

  ErrorBase({this.message, this.stack, this.code});

  @override
  String toString() {
    return "${message ?? ""}${(code != null) ? ". Code: $code" : ""}";
  }
}
