import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/data/mappers/auth.dart';
import 'package:todo_list/domain/entities/auth.dart';
import 'package:todo_list/domain/repositories/auth.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<AuthEntity> signup(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AuthMapper.fromFirebase(credential);
  }
}
