import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/products/bloc/product_bloc.dart';
import '../../const.dart';
import '../../generated/l10n.dart';
import '../../repositories/products_repository.dart';
import '../../widgets/desktop_top_menu.dart';
import '../../widgets/product_card.dart';
import 'mobile_home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              appBar: screenWidth <= kMobileBreakpoint
                  ? null
                  : AppBar(
                      title: const DesktopTopMenu(),
                    ),
              body: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: kDesktopMaxWidth,
                  ),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is ProductLoadedState) {
                        final products = state.products;

                        return GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  screenWidth <= kMobileBreakpoint ? 1 : 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              //childAspectRatio: 2.0,
                            ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
