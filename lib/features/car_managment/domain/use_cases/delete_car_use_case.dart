import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/core/utils/use_case.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/repository/car_management_repository.dart';

class DeleteCarUseCase extends TPUseCase<DataState, int> {
  @override
  Future<DataState> call(param) =>
      getIt<ICarManagementRepository>().deleteCar(param);
}
