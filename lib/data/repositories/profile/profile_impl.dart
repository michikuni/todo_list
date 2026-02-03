import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/exception.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/datasources/remote/profile/profile.dart';
import 'package:todo_list/data/mappers/profile/profile.dart';
import 'package:todo_list/domain/entities/profile/profile_response.dart';
import 'package:todo_list/domain/repositories/profile/profile.dart';

@LazySingleton(as: IProfileRepository)
class ProfileRepositoryImpl extends IProfileRepository{
  final IProfileDataSource profileData;

  ProfileRepositoryImpl(this.profileData);

  @override
  Future<Either<Failure, ProfileResponseEntity>> getProfile() async {
    try{
      final response = await profileData.getProfile();

      return Right(ProfileMapper.toProfileEntity(response));
    } on NetworkException catch(e){
      return Left(NetworkFailure(e.message));
    } on ServerException catch(e){
      if(e.statusCode == 401){
        return Left(ValidationFailure(e.message));
      }
      return Left(ServerFailure(e.message));
    } on CacheException catch(e){
      return Left(CacheFailure(e.message));
    }
  }
}