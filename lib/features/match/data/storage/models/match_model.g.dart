// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchModelAdapter extends TypeAdapter<MatchModel> {
  @override
  final int typeId = 0;

  @override
  MatchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchModel(
      id: fields[0] as String,
      host: fields[1] as TeamShotModel,
      guest: fields[2] as TeamShotModel,
      score: fields[3] as AttributeModel,
      attributes: (fields[4] as List).cast<AttributeModel>(),
      dateTime: fields[5] as int,
      status: fields[6] as String,
      sport: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MatchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.host)
      ..writeByte(2)
      ..write(obj.guest)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.attributes)
      ..writeByte(5)
      ..write(obj.dateTime)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.sport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
