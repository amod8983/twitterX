import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Feature - settings
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

// Feature - auth
import 'package:twitterx/features/auth/data/provides/auth_provider.dart';
import 'package:twitterx/features/auth/data/repositories/auth_repo.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';
import 'package:twitterx/features/auth/business_logic/user/user_bloc.dart';

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
  sl.registerFactory(() => UserBloc());
}
