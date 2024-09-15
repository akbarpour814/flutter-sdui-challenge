import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';

class GetCarsResponseModel {
  ///hive table auto increment key
  final int id;
  final List<CarAttributeModel> data;

  GetCarsResponseModel({required this.id, required this.data});
}
