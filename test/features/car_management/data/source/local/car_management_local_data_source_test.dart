import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/local/car_management_local_data_source.dart';
import 'package:path/path.dart' as path;

final _random = Random();
String _tempPath =
    path.join(Directory.current.path, '.dart_tool', 'test', 'tmp');

/// Returns a temporary directory in which a Hive can be initialized
Future<Directory> getTempDir() async {
  var name = _random.nextInt(pow(2, 32) as int);
  var dir = Directory(path.join(_tempPath, '${name}_tmp'));

  if (await dir.exists()) await dir.delete(recursive: true);

  await dir.create(recursive: true);
  return dir;
}

void main() {
  late CarManagementLocalDataSource dataSource;

  setUp(() async {
    // Create a temporary directory for Hive.
    final directory = await getTempDir();
    Hive.init(directory.path);
    // await Hive.initFlutter();
    //check if adapter already registerd
    if (!Hive.isAdapterRegistered(CarAttributeModelAdapter().typeId)) {
      Hive.registerAdapter(CarAttributeModelAdapter());
    }
    dataSource = CarManagementLocalDataSource();
  });

  tearDown(() async {
    // Close any open Hive boxes and clear the path after tests
    await Hive.deleteFromDisk();
  });

  group('CarManagementLocalDataSource', () {
    test('should add new car to Hive box successfully', () async {
      // Arrange
      List<CarAttributeModel> carAttributes = [
        CarAttributeModel(
            attrName: 'Color',
            attrValue: 'Red',
            attrLabel: '',
            fileBytes: [],
            id: 0)
      ];

      // Act
      await dataSource.addNewCar(carAttributes);
    });

    test('should delete car from Hive box successfully', () async {
      // Arrange
      int carId = 1;

      // Act
      await dataSource.deleteCar(carId);
    });

    test('should return a list of cars from Hive box', () async {
      // Arrange
      List<CarAttributeModel> carAttributes = [
        CarAttributeModel(
            attrName: 'Color',
            attrValue: 'Red',
            attrLabel: '',
            fileBytes: [],
            id: 0)
      ];

      // Act
      await dataSource.addNewCar(carAttributes);

      // Act
      final result = await dataSource.getAllCars();

      // Assert
      expect(result, isA<List<GetCarsResponseModel>>());
    });

    test('should return an empty list when there are no cars in Hive box',
        () async {
      // Act
      final result = await dataSource.getAllCars();

      // Assert
      expect(result, isEmpty);
    });
  });
}
