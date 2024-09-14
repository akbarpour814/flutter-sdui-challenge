import 'package:injectable/injectable.dart';

abstract class ICarManagementDataSource {
}

@Injectable(
  as: ICarManagementDataSource,
)
class CarManagementDataSource implements ICarManagementDataSource {
}
