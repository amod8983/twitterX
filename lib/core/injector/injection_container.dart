import 'package:get_it/get_it.dart';

// Feature - settings
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

// Feature - auth
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Feature - settings
  sl.registerFactory(() => ThemeBloc());

  // Feature - auth
  sl.registerFactory(() => AuthBloc());
}
