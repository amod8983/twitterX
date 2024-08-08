part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserError extends UserState {
  final String error;
  const UserError({required this.error});

  @override
  List<Object> get props => [error];
}

final class UserLoaded extends UserState {
  final UserDetails userDetails;
  const UserLoaded({required this.userDetails});

  @override
  List<Object> get props => [userDetails];
}
