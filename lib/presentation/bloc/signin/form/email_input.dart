import 'package:formz/formz.dart';

enum EmailValidationError { invalid }
class EmailInput extends FormzInput<String, EmailValidationError>{
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();
  static final mailRex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  @override
  EmailValidationError? validator(String value) {
    if(!mailRex.hasMatch(value)){
      return EmailValidationError.invalid;
    }
    return null;
  }
}