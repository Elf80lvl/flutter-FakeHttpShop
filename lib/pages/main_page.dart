import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8_http_products/const.dart';
import 'package:flutter_bloc8_http_products/pages/home_page/home_page.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/themes/theme_bloc.dart';

import '../widgets/my_bottom_navigation_bar.dart';
import 'cart_page/cart_page.dart';
import 'profile_page/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake HTTP Shop'),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              final themeBloc = BlocProvider.of<ThemeBloc>(context);
              if (state.theme == 'dark') {
                return IconButton(
                    onPressed: () {
                      themeBloc.add(ThemeToLight());
                    },
                    icon: const Icon(Icons.light_mode));
              }
              if (state.theme == 'light') {
                return IconButton(
                    onPressed: () {
                      themeBloc.add(ThemeToDark());
                      //print(state.theme);
                    },
                    icon: const Icon(Icons.dark_mode));
              }
              return const SizedBox();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
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
      bottomNavigationBar: screenWidth <= kMobileBreakpoint
          ? const MyBottomNavigationBar()
          : null,
    );
  }
}
