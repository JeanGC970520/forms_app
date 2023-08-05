part of 'register_cubit.dart';


enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.userName = const Username.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(), 
    this.isValid = false,
  });

  final FormStatus formStatus;
  final Username userName;
  final Email email;
  final Password password;
  final bool isValid;

  @override
  List<Object> get props => [ formStatus, userName, email, password, isValid ];

  RegisterFormState copyWith({
    FormStatus? formStatus, 
    Username? userName,
    Email? email,
    Password? password,
    bool? isValid,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid:  isValid ?? this.isValid,
    );
  }

}

