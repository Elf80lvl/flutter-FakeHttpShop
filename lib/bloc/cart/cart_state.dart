part of 'cart_bloc.dart';

class CartState {
  List cart;
  CartState({required this.cart});
}

class CartInitial extends CartState {
  CartInitial() : super(cart: []);
}
