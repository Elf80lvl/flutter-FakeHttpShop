part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  //final Map<String, dynamic> cart;
  //final List cart;
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}
