part of 'navigation_bloc.dart';

class NavigationState {
  int index;

  NavigationState({required this.index});

  // @override
  // List<Object> get props => [index];
}

class NavigationInitialState extends NavigationState {
  NavigationInitialState() : super(index: 0);
  //List<Object> get props => [index];
}
