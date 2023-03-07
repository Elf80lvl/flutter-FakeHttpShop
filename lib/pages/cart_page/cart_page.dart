import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_http_products/const.dart';
import 'package:flutter_bloc8_http_products/pages/cart_page/cart_empty.dart';
import 'package:flutter_bloc8_http_products/widgets/desktop_top_menu.dart';

import '../../bloc/cart/cart_bloc.dart';

import '../../generated/l10n.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenWidth <= kMobileBreakpoint
          ? null
          : AppBar(
              title: const DesktopTopMenu(),
            ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: kMobileBreakpoint.toDouble(),
          ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<CartBloc>(context);
              if (state.cart.isNotEmpty) {
                final cart = state.cart;
                num total = 0;
                cart.forEach(
                  (element) {
                    total = total + element.price * element.count;
                  },
                );
                return ListView(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(cart[index].title),
                            subtitle: Text('${cart[index].price} \$'),
                            leading: IconButton(
                              onPressed: () {
                                bloc.add(RemoveItemCartEvent(index));
                              },
                              icon: const Icon(Icons.clear),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    bloc.add(MinusOneCartEvent(index));
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${cart[index].count}'),
                                IconButton(
                                  onPressed: () {
                                    bloc.add(PlusOneCartEvent(index));
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          );
                        }),

                    //*total price
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Row(
                        children: [
                          Text(
                            '${S.of(context).total}:  $total \$',
                            style: kTotalInCartTextStyle,
                          ),
                        ],
                      ),
                    ),

                    //*Check Out Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(S.of(context).done)));
                            bloc.add(ClearCartEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kAddToCartButtonColor,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            S.of(context).checkout,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const CartEmpty();
              }
            },
          ),
        ),
      ),
    );
  }
}
