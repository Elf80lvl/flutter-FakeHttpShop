import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  //Map<String, dynamic> cart;
  List cart;
  CartBloc(this.cart) : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {
      emit(CartState(cart: cart));
    });
  }
}
