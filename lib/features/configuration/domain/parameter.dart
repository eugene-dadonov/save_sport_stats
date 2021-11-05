import 'package:uuid/uuid.dart';

class Parameter {
  final String id;
  String name;
  final bool isDeletable;

  Parameter({required this.id, required this.name, this.isDeletable = false});

  factory Parameter.newParameter(String name) {
    return Parameter(id: const Uuid().v1(), name: name, isDeletable: false);
  }

  Parameter copyWith(String? name) => Parameter(
        id: id,
        name: name ?? this.name,
        isDeletable: isDeletable,
      );
}
