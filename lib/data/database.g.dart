// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserNameAdapter extends TypeAdapter<UserName> {
  @override
  final int typeId = 0;

  @override
  UserName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserName(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserName obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalAmountAdapter extends TypeAdapter<TotalAmount> {
  @override
  final int typeId = 1;

  @override
  TotalAmount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalAmount(
      fields[0] as double,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TotalAmount obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.showOnboard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  final int typeId = 2;

  @override
  IconData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconData(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
