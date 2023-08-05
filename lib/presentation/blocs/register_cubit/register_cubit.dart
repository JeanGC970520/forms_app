import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit Submit: $state');
  }

  void userNameChanged( String value ) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        userName: username,
        isValid: Formz.validate([ username ]),
      )
    );
  }

  void emailChanged( String value ) {
    emit(
      state.copyWith(
        email: value,
      )
    );
  }

  void passwordChanged( String value ) {
    emit(
      state.copyWith(
        password: value,
      )
    );
  }

}
