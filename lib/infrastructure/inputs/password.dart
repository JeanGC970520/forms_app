
import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  // * Initial value
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // * Change data
  const Password.dirty( String value ) : super.dirty(value);

  String? get errorMessage {
    // * isPure help to know if the form field changed its initial value
    if( isValid || isPure ) return null;

    if( displayError == PasswordError.empty ) return 'Field required';
    if( displayError == PasswordError.length ) return 'At least 6 words';

    return null;

  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {

    if( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if( value.length < 6 ) return PasswordError.length;
    return null;

  }
}