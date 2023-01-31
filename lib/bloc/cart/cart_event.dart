part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartItem cartItem;
  const AddToCartEvent(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}

class PlusOneCartEvent extends CartEvent {
  final int index;
  const PlusOneCartEvent(this.index);

  @override
  List<Object> get props => [];
}

class MinusOneCartEvent extends CartEvent {
  final int index;

  const MinusOneCartEvent(this.index);

  @override
  List<Object> get props => [index];
}

class RemoveItemCartEvent extends CartEvent {
  final int index;
  const RemoveItemCartEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ClearCartEvent extends CartEvent {}
