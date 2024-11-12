import 'package:educontrol/core/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
  }

  _onLogin(_Login event, Emitter<AuthState> emit) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      routerKey.currentContext!.go(RouterPaths.adminPanel);
    } catch (e) {
      print(e.toString());
      emit(AuthState.error(message: e.toString()));
    }
  }
}
