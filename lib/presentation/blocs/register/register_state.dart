part of 'register_cubit.dart';

enum FormStatus { invalid, validad, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;

  final String username;
  final String email;
  final String password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = '',
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterFormState(
          email: email ?? this.email,
          formStatus: formStatus ?? this.formStatus,
          password: password ?? this.password,
          username: username ?? this.username);

  @override
  List<Object> get props => [formStatus, username, email, password];
}

class RegisterInitial extends RegisterFormState {}
