import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'car_attribute_model.g.dart';

@HiveType(typeId: 0)
class CarAttributeModel {
  @HiveField(0)
  final String? attrName;
  @HiveField(1)
  final String? attrValue;
  @HiveField(2)
  List<Uint8List>? fileBytes;

  CarAttributeModel(
      {required this.attrName,
      required this.attrValue,
      required this.fileBytes,});
}
