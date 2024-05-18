part of 'register_cubit.dart';

enum FormStatus { invalid, validad, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
  }) =>
      RegisterFormState(
          isValid: isValid ?? this.isValid,
          email: email ?? this.email,
          formStatus: formStatus ?? this.formStatus,
          password: password ?? this.password,
          username: username ?? this.username);

  @override
  List<Object> get props => [formStatus, username, email, password];
}

class RegisterInitial extends RegisterFormState {}
