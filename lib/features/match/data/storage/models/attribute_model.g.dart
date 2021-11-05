// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributeModelAdapter extends TypeAdapter<AttributeModel> {
  @override
  final int typeId = 1;

  @override
  AttributeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttributeModel(
      parameter: fields[0] as ParameterModel,
      host: fields[1] as int,
      guest: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AttributeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.parameter)
      ..writeByte(1)
      ..write(obj.host)
      ..writeByte(2)
      ..write(obj.guest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
