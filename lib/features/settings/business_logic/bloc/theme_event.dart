part of 'theme_bloc.dart';

@immutable
class ToogleThemeEvent extends Equatable {
  final bool isDarkMode;
  const ToogleThemeEvent({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];
}
