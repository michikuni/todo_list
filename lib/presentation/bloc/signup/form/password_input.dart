import 'package:formz/formz.dart';


enum PasswordValidationError { mismatch }
class PasswordInput extends FormzInput<String, PasswordValidationError>{
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();
  @override
  PasswordValidationError? validator(String value) {
    if(value.length < 6 || value.length > 15){
      return PasswordValidationError.mismatch;
    }
    return null;
  }
}