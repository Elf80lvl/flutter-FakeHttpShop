import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_http_products/model/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List cart;
  CartBloc(this.cart) : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {
      bool present = false;
      //*check duplicates
      for (var i = 0; i < cart.length; i++) {
        if (event.cartItem.title == cart[i].title) {
          print('found duplicate');
          present = true;
          break;
        }
      }

      //*add if not duplicated
      if (present == false) {
        print('adding');
        cart.add(event.cartItem);
      }

      emit(CartState(cart: cart));
    });

    on<PlusOneCartEvent>((event, emit) {
      cart[event.index].count++;
      emit(CartState(cart: cart));
    });

    on<MinusOneCartEvent>((event, emit) {
      if (cart[event.index].count >= 1) {
        cart[event.index].count--;
        emit(CartState(cart: cart));
      }
    });

    on<RemoveItemCartEvent>((event, emit) {
      cart.removeAt(event.index);
      emit(CartState(cart: cart));
    });

    on<ClearCartEvent>((event, emit) {
      cart = [];
      emit(CartState(cart: cart));
    });
  } //////
}
