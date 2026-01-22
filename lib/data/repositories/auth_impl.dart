import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/datasources/remote/auth.dart';
import 'package:todo_list/data/mappers/auth.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/entities/auth_response.dart';
import 'package:todo_list/domain/repositories/auth.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, AuthResponseEntity>> signup(AuthEntity auth) async {
    try {
      final data = AuthMapper.toModel(auth);
    final response = await authDatasource.signup(data);
    return Right(AuthMapper.toEntity(response));
    } on ServerException catch (e){
      if(e.statusCode == 400){
        return Left(ValidationFailure(e.message));
      }
      return Left(ServerFailure(e.message));
    } on NetworkException catch(e){
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e){
      return Left(CacheFailure(e.message));
    }
  }
}
