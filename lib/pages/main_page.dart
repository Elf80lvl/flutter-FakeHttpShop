import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_http_products/pages/home_page.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../generated/l10n.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state.index == 0) {
            return const HomePage();
          }
          if (state.index == 1) {
            return const CartPage();
          }
          if (state.index == 2) {
            return const ProfilePage();
          }
          return const HomePage();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          final navBloc = BlocProvider.of<NavigationBloc>(context);
          return NavigationBar(
            selectedIndex: state.index,
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
              NavigationDestination(
                icon: const Icon(Icons.home),
                label: S.of(context).home,
              ),
              NavigationDestination(
                icon: const Icon(Icons.shopping_bag),
                label: S.of(context).cart,
              ),
              NavigationDestination(
                icon: const Icon(Icons.person),
                label: S.of(context).profile,
              ),
            ],
          );
        },
      ),
    );
  }
}