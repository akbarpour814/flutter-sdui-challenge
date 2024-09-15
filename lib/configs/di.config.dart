// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/car_management/data/repository/car_management_repository_impl.dart'
    as _i737;
import '../features/car_management/data/source/local/car_management_local_data_source.dart'
    as _i613;
import '../features/car_management/data/source/remote/car_management_remote_data_source.dart'
    as _i805;
import '../features/car_management/domain/repository/car_management_repository.dart'
    as _i848;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i848.ICarManagementRepository>(
        () => _i737.CarManagementRepository());
    gh.factory<_i613.ICarManagementLocalDataSource>(
        () => _i613.CarManagementLocalDataSource());
    gh.factory<_i805.ICarManagementRemoteDataSource>(
        () => _i805.CarManagementRemoteDataSource());
    return this;
  }
}
