import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:twitterx/features/auth/data/models/file_model.dart';
import 'package:twitterx/features/auth/data/models/user_details.dart';
import 'package:twitterx/features/auth/data/repositories/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  UserBloc({required this.userRepo}) : super(UserInitial()) {
    on<UserCreate>(_onUserCreate);
    on<UserUpdate>(_onUserUpdate);
    on<UserDelete>(_onUserDelete);
    on<UserDetailsById>(_getUserById);
    on<UserGetCurrentDetails>(_getCurrentUser);
  }

  void _onUserCreate(UserCreate event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      UserDetails user = await userRepo.createUser(
        event.userdetails,
        event.userPhoto,
      );
      emit(UserLoaded(userDetails: user));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

  void _onUserUpdate(UserUpdate event, Emitter<UserState> emit) {}
  void _onUserDelete(UserDelete event, Emitter<UserState> emit) {}
  void _getUserById(UserDetailsById event, Emitter<UserState> emit) {}
  void _getCurrentUser(UserGetCurrentDetails event, Emitter<UserState> emit) {}
}
