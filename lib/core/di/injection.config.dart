// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_list/core/di/injection.dart' as _i551;
import 'package:todo_list/core/network/dio_client.dart' as _i679;
import 'package:todo_list/data/datasources/interceptor/token_interceptor.dart'
    as _i597;
import 'package:todo_list/data/datasources/local/token/token_stograge.dart'
    as _i927;
import 'package:todo_list/data/datasources/local/token/token_stograge_impl.dart'
    as _i440;
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
    final registerModule = _$RegisterModule();
    final dioClient = _$DioClient();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStograge,
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioClient.refreshDio(),
      instanceName: 'refreshDio',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioClient.unTokenDio(),
      instanceName: 'unTokenDio',
    );
    gh.lazySingleton<_i927.TokenStorage>(
      () => _i440.TokenStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i597.TokenInterceptor>(
      () => _i597.TokenInterceptor(
        gh<_i361.Dio>(instanceName: 'refreshDio'),
        gh<_i927.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioClient.dio(gh<_i597.TokenInterceptor>()),
      instanceName: 'tokenDio',
    );
    gh.lazySingleton<_i344.AuthDatasource>(
      () => _i159.AuthDatasourceImpl(
        gh<_i361.Dio>(instanceName: 'unTokenDio'),
        gh<_i361.Dio>(instanceName: 'tokenDio'),
        gh<_i927.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i410.IAuthRepository>(
      () => _i727.AuthRepositoryImpl(gh<_i344.AuthDatasource>()),
    );
    gh.lazySingleton<_i705.SignupUseCase>(
      () => _i705.SignupUseCase(gh<_i410.IAuthRepository>()),
    );
    gh.lazySingleton<_i705.SigninUseCase>(
      () => _i705.SigninUseCase(gh<_i410.IAuthRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i551.RegisterModule {}

class _$DioClient extends _i679.DioClient {}
