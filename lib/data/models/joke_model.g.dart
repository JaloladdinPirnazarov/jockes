// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeModelAdapter extends TypeAdapter<JokeModel> {
  @override
  final int typeId = 0;

  @override
  JokeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, JokeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.setup)
      ..writeByte(2)
      ..write(obj.punchline)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
