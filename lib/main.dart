import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterx/features/auth/presentation/screens/welcome.dart';
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';
import 'package:twitterx/theme.dart';
import 'package:twitterx/injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
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
