// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_shot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamShotModelAdapter extends TypeAdapter<TeamShotModel> {
  @override
  final int typeId = 5;

  @override
  TeamShotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamShotModel(
      id: fields[0] as String,
      name: fields[1] as String,
      teamColor: fields[2] as String,
      city: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeamShotModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.teamColor)
      ..writeByte(3)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamShotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
