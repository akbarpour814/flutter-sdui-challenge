import 'dart:io';

import 'package:hive/hive.dart';
part 'car_attribute_model.g.dart';

@HiveType(typeId: 0)
class CarAttributeModel {
  @HiveField(0)
  final String? attrName;
  @HiveField(1)
  final String? attrValue;
  @HiveField(2)
  final List<File>? images;

  CarAttributeModel(
      {required this.attrName, required this.attrValue, required this.images});
}
