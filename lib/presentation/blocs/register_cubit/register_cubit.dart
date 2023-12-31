import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    // * Emitting new state to notify that the user try to validate
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        userName: Username.dirty( state.userName.value ),
        password: Password.dirty( state.password.value ),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([
          state.userName, 
          state.email,
          state.password,
        ])
      )
    );


    print('Cubit Submit: $state');
  }

  void userNameChanged( String value ) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        userName: username,
        // * Validate trigger the override validate() method on every custom Formz
        isValid: Formz.validate([ username, state.password, state.email ]),
      )
    );
  }

  void emailChanged( String value ) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email, state.userName, state.password ])
      )
    );
  }

  void passwordChanged( String value ) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.userName, state.email ])
      )
    );
  }

}
