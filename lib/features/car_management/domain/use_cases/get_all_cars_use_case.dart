import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/core/utils/use_case.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';

class GetAllCarsUseCase
    extends TUseCase<DataState<List<List<CarAttributeModel>>>> {
  @override
  Future<DataState<List<List<CarAttributeModel>>>> call() =>
      getIt<ICarManagementRepository>().getAllCars();
}
