part of 'register_cubit.dart';


enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.userName = '', 
    this.email = '', 
    this.password = '', 
  });

  final FormStatus formStatus;
  final String userName;
  final String email;
  final String password;

  @override
  List<Object> get props => [ formStatus, userName, email, password ];

  RegisterFormState copyWith({
    FormStatus? formStatus, 
    String? userName,
    String? email,
    String? password,
  }) {
    return RegisterFormState(
      formStatus: formStatus ?? this.formStatus,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

}

