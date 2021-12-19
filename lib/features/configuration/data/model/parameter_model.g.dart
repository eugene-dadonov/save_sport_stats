// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParameterModelAdapter extends TypeAdapter<ParameterModel> {
  @override
  final int typeId = 3;

  @override
  ParameterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParameterModel(
      id: fields[0] as String,
      name: fields[1] as String,
      isDeletable: fields[2] as bool,
      sport: fields[3] as String,
      standardParameter: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParameterModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeletable)
      ..writeByte(3)
      ..write(obj.sport)
      ..writeByte(4)
      ..write(obj.standardParameter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParameterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
