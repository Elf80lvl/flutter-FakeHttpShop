part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationHomeEvent extends NavigationEvent {
  final int index;
  const NavigationHomeEvent({this.index = 0});

  @override
  List<Object> get props => [index];
}

class NavigationCartEvent extends NavigationEvent {
  final int index;
  const NavigationCartEvent({this.index = 1});

  @override
  List<Object> get props => [index];
}

class NavigationProfileEvent extends NavigationEvent {
  final int index;
  const NavigationProfileEvent({this.index = 2});

  @override
  List<Object> get props => [index];
}
