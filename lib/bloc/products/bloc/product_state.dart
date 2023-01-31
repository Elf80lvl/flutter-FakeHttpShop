part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final List products;
  const ProductLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends ProductState {
  final String error;
  const ProductErrorState(this.error);

  @override
  List<Object> get props => [error];
}
