import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterx/features/settings/business_logic/bloc/theme_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeBloc>(context).add(const ToogleThemeEvent(
            isDarkMode: false));
        },
        child: const Icon(Icons.toggle_off_sharp),
      ),
      body: const Center(
        child: Text('Welcome'),
      ),
    );
  }
}
