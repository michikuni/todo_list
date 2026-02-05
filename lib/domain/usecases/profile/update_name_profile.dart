import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/profile/profile_response.dart';
import 'package:todo_list/domain/repositories/profile/profile.dart';

@lazySingleton
class UpdateNameProfileUseCase{
  final IProfileRepository _repository;
  UpdateNameProfileUseCase(this._repository);

  Future<Either<Failure, ProfileResponseEntity>>call(String name){
    return _repository.updateNameProfile(name);
  }
}