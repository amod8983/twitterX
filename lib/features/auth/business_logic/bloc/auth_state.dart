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
  final UserDetails currentUserDetails;

  const AuthSuccess({
    required this.currentUserDetails,
  });

  @override
  List<Object?> get props => [currentUserDetails];
}

final class AuthError extends AuthState {
  final String errorMessage;
  final String? code;

  const AuthError({
    this.code,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage, code];
}
