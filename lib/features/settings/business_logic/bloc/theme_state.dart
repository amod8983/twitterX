part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}
