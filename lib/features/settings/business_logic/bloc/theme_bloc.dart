import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ToogleThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    on<ToogleThemeEvent>(
      (event, emit) {
        emit(ThemeState(
            themeMode: event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
      },
    );
  }
}
