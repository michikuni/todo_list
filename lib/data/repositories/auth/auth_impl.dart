import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/datasources/remote/auth/auth.dart';
import 'package:todo_list/data/mappers/auth/auth.dart';
import 'package:todo_list/domain/entities/auth/auth.dart';
import 'package:todo_list/domain/entities/auth/auth_response.dart';
import 'package:todo_list/domain/repositories/auth/auth.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, SignupResponseEntity>> signup(
    SignupEntity auth,
  ) async {
    try {
      final data = AuthMapper.toSignupModel(auth);
      final response = await authDatasource.signup(data);
      return Right(AuthMapper.toSignupEntity(response));
    } on ServerException catch (e) {
      if (e.statusCode == 401) {
        return Left(ValidationFailure(e.message));
      }
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SigninResponseEntity>> signin(SigninEntity auth) async {
    try{
      final data = AuthMapper.toSigninModel(auth);
      final response = await authDatasource.signin(data);
      // log(response);
      return Right(AuthMapper.toSigninEntity(response));
    } on ServerException catch(e){
      if(e.statusCode == 401){
        // log(e.message);
        // log(e.statusCode.toString());
        return Left(ValidationFailure(e.message));
      }
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e){
      return Left(NetworkFailure(e.message));
    } on CacheException catch(e){
      return Left(CacheFailure(e.message));
    }
  }
}
