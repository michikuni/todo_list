// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_list/core/network/dio_client.dart' as _i679;
import 'package:todo_list/data/datasources/remote/auth.dart' as _i344;
import 'package:todo_list/data/datasources/remote/remote_impl/auth.dart'
    as _i159;
import 'package:todo_list/data/repositories/auth_impl.dart' as _i727;
import 'package:todo_list/domain/repositories/auth.dart' as _i410;
import 'package:todo_list/domain/usecases/auth.dart' as _i705;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioClient = _$DioClient();
    gh.lazySingleton<_i361.Dio>(() => dioClient.dio());
    gh.lazySingleton<_i344.AuthDatasource>(
      () => _i159.AuthDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i410.IAuthRepository>(
      () => _i727.AuthRepositoryImpl(gh<_i344.AuthDatasource>()),
    );
    gh.lazySingleton<_i705.CreateAuthUseCase>(
      () => _i705.CreateAuthUseCase(gh<_i410.IAuthRepository>()),
    );
    return this;
  }
}

class _$DioClient extends _i679.DioClient {}
