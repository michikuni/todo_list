abstract class SignupEvent {}

class SignupSubmitEvent extends SignupEvent {}

class OnUsernameChanged extends SignupEvent {
  final String userName;
  OnUsernameChanged({required this.userName});
}

class OnPasswordChanged extends SignupEvent {
  final String password;
  OnPasswordChanged({required this.password});
}

class OnConfirmPasswordChanged extends SignupEvent{
  final String confirmPassword;
  OnConfirmPasswordChanged({required this.confirmPassword});
}
