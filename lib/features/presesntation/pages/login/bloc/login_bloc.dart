import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../domain/entities/login_entities.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String username;
  final String password;

  LoginBloc({
    this.username = "",
    this.password = "",
  }) : super(LoginStateInitial()) {
    on<LoginUsernameChanged>(_usernameEvent);
    on<LoginPasswordChanged>(_passwordEvent);
    on<LoginEventInitial>(_initial);
  }
  void _initial(LoginEventInitial event, Emitter<LoginState> emit) {
    emit(state.copyWith());
  }

    void _usernameEvent(LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEvent(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
