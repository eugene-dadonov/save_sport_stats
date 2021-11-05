// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigurationModelAdapter extends TypeAdapter<ConfigurationModel> {
  @override
  final int typeId = 4;

  @override
  ConfigurationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigurationModel(
      id: fields[0] as String,
      name: fields[1] as String,
      parameters: (fields[2] as List).cast<ParameterModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConfigurationModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.parameters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigurationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
