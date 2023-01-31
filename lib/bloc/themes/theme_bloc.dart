import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeToDark>((event, emit) {
      emit(const ThemeState('dark'));
    });

    on<ThemeToLight>((event, emit) {
      emit(const ThemeState('light'));
    });
  }
}
