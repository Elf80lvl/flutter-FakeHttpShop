import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_http_products/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/products/bloc/product_bloc.dart';
import '../bloc/themes/theme_bloc.dart';
import '../generated/l10n.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final navBloc = BlocProvider.of<NavigationBloc>(context);
        return NavigationBar(
          selectedIndex: state.index,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (index) {
            if (index == 0) {
              navBloc.add(const NavigationHomeEvent());
            }

            if (index == 1) {
              navBloc.add(const NavigationCartEvent());
            }

            if (index == 2) {
              navBloc.add(const NavigationProfileEvent());
            }
          },
          destinations: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return NavigationDestination(
                  icon: state.theme == 'light'
                      ? SvgPicture.asset('assets/icons/Shop.svg')
                      : SvgPicture.asset('assets/icons/Shop_white.svg'),
                  //selectedIcon: SvgPicture.asset('assets/icons/Shop_white.svg'),
                  label: S.of(context).home,
                );
              },
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return NavigationDestination(
                  // icon: state.theme == 'light'
                  //     ? SvgPicture.asset('assets/icons/Bag_fill.svg')
                  //     : SvgPicture.asset('assets/icons/Bag_fill_white.svg'),
                  icon: Stack(
                    children: [
                      state.theme == 'light'
                          ? SvgPicture.asset('assets/icons/Bag_fill.svg')
                          : SvgPicture.asset('assets/icons/Bag_fill_white.svg'),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, cartState) {
                          return Positioned(
                            top: 0,
                            right: 0,
                            child: cartState.cart.isEmpty
                                ? const SizedBox()
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: kCartCountBGColor,
                                    ),
                                    child:
                                        Text(cartState.cart.length.toString()),
                                  ),
                          );
                        },
                      )
                    ],
                  ),
                  label: S.of(context).cart,
                );
              },
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return NavigationDestination(
                  icon: state.theme == 'light'
                      ? SvgPicture.asset('assets/icons/User_fill.svg')
                      : SvgPicture.asset('assets/icons/User_fill_white.svg'),
                  label: S.of(context).profile,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
