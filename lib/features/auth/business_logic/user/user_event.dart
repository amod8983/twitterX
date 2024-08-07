part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserCreate extends UserEvent {
  final UserDetails userdetails;
  const UserCreate({required this.userdetails});

  @override
  List<Object> get props => [userdetails];
}

class UserUpdate extends UserEvent {
  final UserDetails userdetails;
  const UserUpdate({required this.userdetails});

  @override
  List<Object> get props => [userdetails];
}

class UserDelete extends UserEvent {
  final String userId;
  const UserDelete({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UserGetCurrentDetails extends UserEvent {
  const UserGetCurrentDetails();
}

class UserDetailsById extends UserEvent {
  final String userId;
  const UserDetailsById({required this.userId});

  @override
  List<Object> get props => [userId];
}