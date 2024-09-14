import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/core/utils/use_case.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/repository/car_management_repository.dart';

class AddNewCarUseCase
    extends TPUseCase<DataState,List<CarAttributeModel>> {
  @override
  Future<DataState> call(param) =>
      getIt<ICarManagementRepository>().addNewCar(param);
}
