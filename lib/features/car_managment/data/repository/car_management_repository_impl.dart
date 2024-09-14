import 'package:flutter_sdui_challenge/features/car_managment/domain/repository/car_management_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(
  as: ICarManagementRepository,
)
class CarManagementRepository implements ICarManagementRepository {}
