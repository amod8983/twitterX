import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:twitterx/features/auth/data/models/user_details.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignupRequested>(_onSignupRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  void _onSignupRequested(AuthSignupRequested event, Emitter<AuthState> emit) {}

  void _onLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) {}

  void _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) {}
}
