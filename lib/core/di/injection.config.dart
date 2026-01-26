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
import 'package:todo_list/data/datasources/remote/profile.dart' as _i718;
import 'package:todo_list/data/datasources/remote/remote_impl/auth.dart'
    as _i159;
import 'package:todo_list/data/datasources/remote/remote_impl/profile.dart'
    as _i710;
import 'package:todo_list/data/repositories/auth/auth_impl.dart' as _i294;
import 'package:todo_list/data/repositories/profile/profile_impl.dart' as _i669;
import 'package:todo_list/domain/repositories/auth/auth.dart' as _i360;
import 'package:todo_list/domain/repositories/profile/profile.dart' as _i827;
import 'package:todo_list/domain/usecases/auth/auth.dart' as _i482;
import 'package:todo_list/domain/usecases/profile/profile.dart' as _i1029;

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
      () => _i597.TokenInterceptor(gh<_i927.TokenStorage>()),
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
    gh.lazySingleton<_i718.IProfileDataSource>(
      () =>
          _i710.ProfileDatasourceImpl(gh<_i361.Dio>(instanceName: 'tokenDio')),
    );
    gh.lazySingleton<_i827.IProfileRepository>(
      () => _i669.ProfileRepositoryImpl(gh<_i718.IProfileDataSource>()),
    );
    gh.lazySingleton<_i360.IAuthRepository>(
      () => _i294.AuthRepositoryImpl(gh<_i344.AuthDatasource>()),
    );
    gh.lazySingleton<_i482.SignupUseCase>(
      () => _i482.SignupUseCase(gh<_i360.IAuthRepository>()),
    );
    gh.lazySingleton<_i482.SigninUseCase>(
      () => _i482.SigninUseCase(gh<_i360.IAuthRepository>()),
    );
    gh.lazySingleton<_i1029.GetProfileUseCase>(
      () => _i1029.GetProfileUseCase(gh<_i827.IProfileRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i551.RegisterModule {}

class _$DioClient extends _i679.DioClient {}
