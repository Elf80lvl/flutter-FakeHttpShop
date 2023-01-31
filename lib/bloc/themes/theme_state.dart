part of 'theme_bloc.dart';

class ThemeState {
  final String theme;
  const ThemeState(this.theme);
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super('light');
}
