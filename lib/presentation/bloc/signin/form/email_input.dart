import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class EmailInput extends FormzInput<String, String> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  String? validator(String value) {
    return _emailRegex.hasMatch(value)
        ? null
        : 'Not Valid';
  }
}
