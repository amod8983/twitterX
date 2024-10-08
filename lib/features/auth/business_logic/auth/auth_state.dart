part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthProcessing extends AuthState {
  final String? message;

  const AuthProcessing({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}

final class AuthSuccess extends AuthState {
  final UserCredential userCredential;

  const AuthSuccess({
    required this.userCredential,
  });

  @override
  List<Object?> get props => [userCredential];
}

final class AuthLogoutSuccess extends AuthState {}

final class AuthError extends AuthState {
  final String error;
  final String? code;

  const AuthError({
    this.code,
    required this.error,
  });

  @override
  List<Object?> get props => [error, code];
}
