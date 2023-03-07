import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitialState()) {
    on<NavigationHomeEvent>((event, emit) {
      emit(NavigationState(index: state.index = 0));
    });

    on<NavigationCartEvent>((event, emit) {
      emit(NavigationState(index: state.index = 1));
    });

    on<NavigationProfileEvent>((event, emit) {
      emit(NavigationState(index: state.index = 2));
    });
  }
}
