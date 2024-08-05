part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSignupRequested extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final String name;
  final String gender;
  final String dob;
  final File? pickedImage;
  final String createdAt;
  final String updatedAt;

  AuthSignupRequested({
    required this.email,
    required this.password,
    required this.username,
    required this.name,
    required this.gender,
    required this.dob,
    this.pickedImage,
  })  : createdAt = DateTime.now().toString(),
        updatedAt = DateTime.now().toString();

  @override
  List<Object?> get props =>
      [email, password, username, name, gender, dob, createdAt, updatedAt];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthLoginRequested({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthGetCurrentUserDetails extends AuthEvent {
  const AuthGetCurrentUserDetails();

  @override
  List<Object?> get props => [];
}

class AuthGetUserDetails extends AuthEvent {
  final String userId;
  const AuthGetUserDetails({required this.userId});

  @override
  List<Object?> get props => [userId];
}