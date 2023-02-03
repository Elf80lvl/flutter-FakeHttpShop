import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../bloc/themes/theme_bloc.dart';
import '../generated/l10n.dart';

class DesktopTopMenu extends StatelessWidget {
  const DesktopTopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, navState) {
            final navBloc = BlocProvider.of<NavigationBloc>(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*shop button
                GestureDetector(
                  onTap: () {
                    navBloc.add(const NavigationHomeEvent());
                  },
                  child: Row(
                    children: [
                      themeState.theme == 'light'
                          ? SvgPicture.asset('assets/icons/Shop.svg')
                          : SvgPicture.asset('assets/icons/Shop_white.svg'),
                      Text(
                        S.of(context).home,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 32),

                //*cart button
                GestureDetector(
                  onTap: () {
                    navBloc.add(const NavigationCartEvent());
                  },
                  child: Row(
                    children: [
                      themeState.theme == 'light'
                          ? SvgPicture.asset('assets/icons/Bag_fill.svg')
                          : SvgPicture.asset('assets/icons/Bag_fill_white.svg'),
                      Text(
                        S.of(context).cart,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 32),

                //*profile button
                GestureDetector(
                  onTap: () {
                    navBloc.add(const NavigationProfileEvent());
                  },
                  child: Row(
                    children: [
                      themeState.theme == 'light'
                          ? SvgPicture.asset('assets/icons/User_fill.svg')
                          : SvgPicture.asset(
                              'assets/icons/User_fill_white.svg'),
                      Text(
                        S.of(context).profile,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
