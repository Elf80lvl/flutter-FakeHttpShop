import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/navigation/navigation_bloc.dart';
import '../../generated/l10n.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).cart_is_empty,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<NavigationBloc>(context);
              return GestureDetector(
                  onTap: () {
                    bloc.add(const NavigationHomeEvent());
                  },
                  child: const Text(
                    'Go Shopping',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
