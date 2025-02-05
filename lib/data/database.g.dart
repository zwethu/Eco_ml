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
      fields[0] == null ? 'Unknown' : fields[0] as String,
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
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isIncome);
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

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 3;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      fields[0] as int,
      fields[1] as bool,
      fields[2] as double,
      fields[3] as DateTime,
      fields[4] == null ? 'No description' : fields[4] as String,
      fields[5] == null ? 1 : fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.iconId)
      ..writeByte(1)
      ..write(obj.isExpense)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.datatime)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.cardNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IncomeAdapter extends TypeAdapter<Income> {
  @override
  final int typeId = 4;

  @override
  Income read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Income(
      fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Income obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OutcomeAdapter extends TypeAdapter<Outcome> {
  @override
  final int typeId = 5;

  @override
  Outcome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Outcome(
      fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Outcome obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OutcomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PiggyAdapter extends TypeAdapter<Piggy> {
  @override
  final int typeId = 6;

  @override
  Piggy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Piggy(
      fields[0] as dynamic,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Piggy obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.percentage)
      ..writeByte(1)
      ..write(obj.showPiggy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PiggyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageUrlAdapter extends TypeAdapter<ImageUrl> {
  @override
  final int typeId = 7;

  @override
  ImageUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageUrl(
      fields[0] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, ImageUrl obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
