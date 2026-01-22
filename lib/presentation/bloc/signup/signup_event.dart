import 'package:todo_list/domain/entities/auth.dart';

abstract class SignupEvent{}

class SignupSubmitEvent extends SignupEvent{
  final AuthEntity auth;
  SignupSubmitEvent({required this.auth});
}