import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/data/models/auth.dart';

class AuthMapper {
  static AuthModel fromFirebase(UserCredential firebaseUser) {
    return AuthModel(
      uid: firebaseUser.user?.uid ?? '',
      email: firebaseUser.user?.email ?? '',
      createdTime: firebaseUser.user?.metadata.creationTime?.toIso8601String() ?? '',
    );
  }
}
