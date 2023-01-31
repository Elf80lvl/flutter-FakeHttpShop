import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc8_http_products/repositories/products_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsPepository _productsPepository;

  ProductBloc(this._productsPepository) : super(ProductLoadingState()) {
    on<ProductGetProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await _productsPepository.getProducts();
        emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
