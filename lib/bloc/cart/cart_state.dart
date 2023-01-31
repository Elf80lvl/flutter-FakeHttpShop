part of 'cart_bloc.dart';

class CartState {
  //Map<String, dynamic> cart;
  List cart;
  CartState({required this.cart});
}

class CartInitial extends CartState {
  CartInitial() : super(cart: []);
}
