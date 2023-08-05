part of 'register_cubit.dart';


enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.userName = const Username.pure(), 
    this.email = '', 
    this.password = '', 
    this.isValid = false,
  });

  final FormStatus formStatus;
  final Username userName;
  final String email;
  final String password;
  final bool isValid;

  @override
  List<Object> get props => [ formStatus, userName, email, password, isValid ];

  RegisterFormState copyWith({
    FormStatus? formStatus, 
    Username? userName,
    String? email,
    String? password,
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

