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
      attrValue: fields[1] as String?,
      images: (fields[2] as List?)?.cast<File>(),
    );
  }

  @override
  void write(BinaryWriter writer, CarAttributeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.attrName)
      ..writeByte(1)
      ..write(obj.attrValue)
      ..writeByte(2)
      ..write(obj.images);
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
