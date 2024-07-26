import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterx/features/auth/presentation/screens/welcome.dart';
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';
import 'package:twitterx/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
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
