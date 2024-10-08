// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_attribute_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAttributeModelAdapter extends TypeAdapter<CarAttributeModel> {
  @override
  final int typeId = 0;

  @override
  CarAttributeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarAttributeModel(
      attrName: fields[0] as String?,
      attrLabel: fields[1] as String?,
      attrValue: fields[2] as String?,
      fileBytes: (fields[3] as List?)?.cast<Uint8List>(),
    );
  }

  @override
  void write(BinaryWriter writer, CarAttributeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.attrName)
      ..writeByte(1)
      ..write(obj.attrLabel)
      ..writeByte(2)
      ..write(obj.attrValue)
      ..writeByte(3)
      ..write(obj.fileBytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAttributeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
