import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });
  }
}