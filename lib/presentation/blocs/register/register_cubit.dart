import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterInitial());

  void onSubmit() {
    print('submit ${{state.email, state.formStatus, state.username}}');
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }
}
