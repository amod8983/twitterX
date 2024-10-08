// Flutter package
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Core
import 'package:twitterx/core/theme/theme.dart';
import 'package:twitterx/core/widgets/splash_screen.dart';
import 'package:twitterx/core/config/firebase_options.dart';
import 'package:twitterx/core/injector/injection_container.dart' as di;
import 'package:twitterx/core/injector/bloc_observer.dart';
import 'package:twitterx/features/auth/business_logic/user/user_bloc.dart';

// Feature - Auth
import 'package:twitterx/features/auth/presentation/screens/welcome.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';
import 'package:twitterx/features/feed/presentation/screens/feed_screen.dart';

// Feature - Settings
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize bloc observer to log state update
  Bloc.observer = const TwitterXBlocObserver();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Service locator
  await di.init();
  // Setup the app orientation [App will always open in portrait]
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const HomePage());
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di.sl<AuthBloc>()),
              BlocProvider(create: (_) => di.sl<UserBloc>()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TwitterX',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeState.themeMode,
              home: StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SplashScreen();
                    }
                    if (snapshot.hasData) {
                      return const FeedScreen();
                    } else {
                      return const Welcome();
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}
