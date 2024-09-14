// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/car_managment/data/repository/car_management_repository_impl.dart'
    as _i916;
import '../features/car_managment/data/source/car_management_data_source.dart'
    as _i1028;
import '../features/car_managment/domain/repository/car_management_repository.dart'
    as _i326;

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
    gh.factory<_i326.ICarManagementRepository>(
        () => _i916.CarManagementRepository());
    gh.factory<_i1028.ICarManagementDataSource>(
        () => _i1028.CarManagementDataSource());
    return this;
  }
}
