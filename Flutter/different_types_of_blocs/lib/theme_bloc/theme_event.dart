part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class ToggleTheme extends ThemeEvent {}