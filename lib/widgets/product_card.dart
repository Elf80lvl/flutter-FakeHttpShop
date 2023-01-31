import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';
import '../const.dart';
import '../generated/l10n.dart';
import '../model/cart_item.dart';

//ProductCard (title, description, price, discountPercentage, rating, stock, thumbnail)

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final double? discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;

  const ProductCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kProductCardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kProductCardBorderRadius),
                  child: Image.network(thumbnail),
                ),
                if (discountPercentage != null)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 91, 91),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-$discountPercentage %',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ]),
              const SizedBox(height: 8),
              //*in stock
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: kInStockContainerColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'In stock: $stock',
                  style: const TextStyle(
                    color: kInStockTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              //*title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //const SizedBox(height: 8),
              //*description
              Text(
                description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              //*price
              Text(
                '$price \$',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              //*rating
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 18,
                  ),
                  Text(
                    rating.toString(),
                    //style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              //*add to cart button
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final cartBloc = BlocProvider.of<CartBloc>(context);

                  final cartItem = CartItem(
                    title: title,
                    description: description,
                    price: price,
                  );

                  return ElevatedButton(
                    onPressed: () {
                      cartBloc.add(AddToCartEvent(cartItem));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content:
                              Text('$title ${S.of(context).added_to_cart}')));
                      //print(state.cart.last.title);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: kAddToCartButtonColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag,
                          color: kAddToCartTextColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          S.of(context).addToCart,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kAddToCartTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
