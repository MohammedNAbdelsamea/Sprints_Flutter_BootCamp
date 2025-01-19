part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {
  final bool isDark;

  ThemeInitial(this.isDark);
}