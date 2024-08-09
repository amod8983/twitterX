// Flutter plugin
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Feature - settings
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

// Feature - auth
import 'package:twitterx/features/auth/data/provides/auth_provider.dart';
import 'package:twitterx/features/auth/data/repositories/auth_repo.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';
import 'package:twitterx/features/auth/business_logic/user/user_bloc.dart';
import 'package:twitterx/features/auth/data/repositories/user_repo.dart';
import 'package:twitterx/features/auth/data/provides/user_details_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Feature - settings
  sl.registerFactory(() => ThemeBloc());

  // Feature - auth
  sl.registerLazySingleton<AuthDataProvider>(
    () => AuthDataProvider(firebaseAuth: FirebaseAuth.instance),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepo(authProvider: sl<AuthDataProvider>()),
  );
  sl.registerFactory(() => AuthBloc(authRepo: sl<AuthRepo>()));

  // Fetaure - auth - user
  sl.registerLazySingleton<UserDetailsProvider>(
    () => UserDetailsProvider(firebaseFirestore: FirebaseFirestore.instance),
  );
  sl.registerLazySingleton<UserRepo>(
    () => UserRepo(userProvider: sl<UserDetailsProvider>()),
  );
  sl.registerFactory(() => UserBloc(userRepo: sl<UserRepo>()));
}
