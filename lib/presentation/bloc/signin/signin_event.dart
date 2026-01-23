abstract class SigninEvent{}

class SigninSubmitEvent extends SigninEvent{}

class OnUsernameChanged extends SigninEvent{
  final String username;
  OnUsernameChanged(this.username);
}

class OnPasswordChanged extends SigninEvent{
  final String password;
  OnPasswordChanged(this.password);
}