// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoModelAdapter extends TypeAdapter<TodoModel> {
  @override
  final int typeId = 0;

  @override
  TodoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoModel(
      content: fields[0] as String,
      description: fields[1] as String,
      categoryName: fields[4] as String,
      categoryColor: fields[10] as int,
      categoryIcon: fields[11] as String,
      priority: fields[5] as int,
      date: fields[2] as DateTime,
      minutes: fields[3] as int,
      userId: fields[6] as int,
      email: fields[7] as String,
      name: fields[8] as String,
      avatar: fields[9] as String,
      isDone: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.minutes)
      ..writeByte(4)
      ..write(obj.categoryName)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.avatar)
      ..writeByte(10)
      ..write(obj.categoryColor)
      ..writeByte(11)
      ..write(obj.categoryIcon)
      ..writeByte(12)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
