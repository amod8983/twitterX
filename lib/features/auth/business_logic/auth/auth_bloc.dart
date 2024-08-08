import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterx/features/auth/data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthSignupRequested>(_onSignupRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  void _onSignupRequested(
    AuthSignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthProcessing(message: 'Signup in process'));
      UserCredential userCredential = await authRepo.signup(
        event.email,
        event.password,
      );
      emit(AuthSuccess(userCredential: userCredential));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  void _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthProcessing(message: 'Login in process'));
      UserCredential userCredential = await authRepo.login(
        event.email,
        event.password,
      );
      emit(AuthSuccess(userCredential: userCredential));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthProcessing());
      await authRepo.logout();
      emit(AuthLogoutSuccess());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
