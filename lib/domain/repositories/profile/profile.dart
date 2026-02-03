import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/profile/profile_response.dart';

abstract class IProfileRepository{
  Future<Either<Failure, ProfileResponseEntity>> getProfile();
}