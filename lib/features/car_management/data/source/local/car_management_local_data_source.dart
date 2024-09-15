import 'dart:developer';

import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ICarManagementLocalDataSource {
  Future<void> addNewCar(List<CarAttributeModel> request);
  Future<void> deleteCar(int id);
  Future<List<GetCarsResponseModel>> getAllCars();
}

@Injectable(as: ICarManagementLocalDataSource)
class CarManagementLocalDataSource implements ICarManagementLocalDataSource {
  @override
  Future<void> addNewCar(List<CarAttributeModel> request) async {
    try {
      var hiveBox = await Hive.openBox('carBox');
      await hiveBox.add(request);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> deleteCar(int id) async {
    try {
      var hiveBox = await Hive.openBox('carBox');
      await hiveBox.delete(id);
      await hiveBox.close();
    } catch (e) {}
  }

  @override
  Future<List<GetCarsResponseModel>> getAllCars() async {
    try {
      var hiveBox = await Hive.openBox('carBox');
      List<GetCarsResponseModel> retList = [];
      if (hiveBox.values.isNotEmpty) {
        for (var element in hiveBox.values) {
          retList.add(GetCarsResponseModel(
              id: hiveBox.keys
                  .toList()[hiveBox.values.toList().indexOf(element)] as int,
              data: (element as List)
                  .map((e1) => e1 as CarAttributeModel)
                  .toList()));
        }
        await hiveBox.close();
        return retList;
      }
      await hiveBox.close();
      return retList;
    } catch (e) {
      return [];
    }
  }
}
