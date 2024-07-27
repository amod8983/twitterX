// Flutter package
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Core
import 'package:twitterx/core/theme/theme.dart';
import 'package:twitterx/core/config/firebase_options.dart';
import 'package:twitterx/core/injector/injection_container.dart' as di;

// Feature - Auth
import 'package:twitterx/features/auth/presentation/screens/welcome.dart';

// Feature - Settings
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Service locator
  await di.init();
  // Setup the app orientation [App will always open in portrait]
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TwitterX',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeState.themeMode,
            home: const Welcome(),
          );
        },
      ),
    );
  }
}
