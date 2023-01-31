import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products/bloc/product_bloc.dart';
import '../const.dart';
import '../repositories/products_repository.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc(RepositoryProvider.of<ProductsPepository>(context))
            ..add(ProductGetProductsEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<ProductBloc>(context)
                  .add(ProductGetProductsEvent());
            },
            child: Scaffold(
              body: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductLoadedState) {
                    final products = state.products;
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            title: products[index].title,
                            description: products[index].description,
                            price: products[index].price,
                            discountPercentage:
                                products[index].discountPercentage,
                            rating: products[index].rating,
                            stock: products[index].stock,
                            thumbnail: products[index].thumbnail,
                          );
                        });
                  }

                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
