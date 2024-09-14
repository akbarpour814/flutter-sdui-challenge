import 'package:flutter_sdui_challenge/features/car_managment/data/models/car_attribute_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ICarManagementLocalDataSource {
  Future<void> addNewCar(List<CarAttributeModel> request);
  Future<void> deleteCar(int id);
  Future<List<List<CarAttributeModel>>?> getAllCars();
}

@Injectable(as: ICarManagementLocalDataSource)
class CarManagementLocalDataSource implements ICarManagementLocalDataSource {
  @override
  Future<void> addNewCar(List<CarAttributeModel> request) async {
    try {
      var hiveBox = await Hive.openBox<List<CarAttributeModel>>('carBox');
      await hiveBox.add(request);
    } catch (e) {}
  }

  @override
  Future<void> deleteCar(int id) async {
    try {
      var hiveBox = await Hive.openBox<List<CarAttributeModel>>('carBox');
      await hiveBox.delete(id);
      await hiveBox.close();
    } catch (e) {}
  }

  @override
  Future<List<List<CarAttributeModel>>?> getAllCars() async {
    try {
      var hiveBox = await Hive.openBox<List<CarAttributeModel>>('carBox');
      final retList = hiveBox.values.toList();
      await hiveBox.close();
      return retList;
    } catch (e) {
      return null;
    }
  }
}
