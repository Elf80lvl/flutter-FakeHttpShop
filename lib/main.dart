import 'package:flutter/material.dart';
import 'package:flutter_bloc8_http_products/pages/home_page.dart';
import 'package:flutter_bloc8_http_products/pages/main_page.dart';
import 'package:flutter_bloc8_http_products/themes.dart';
import 'bloc/cart/cart_bloc.dart';
import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/themes/theme_bloc.dart';
import 'generated/l10n.dart';
import 'repositories/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc([]),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: RepositoryProvider(
        create: (context) => ProductsPepository(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final theme;
            state.theme == 'dark' ? theme = kDarkTheme : theme = kLightTheme;
            return MaterialApp(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: kDarkTheme,
              themeMode: ThemeMode.system,
              home: const MainPage(),
            );
          },
        ),
      ),
    );
  }
}

//TODO change language with bloc
//TODO change theme with bloc
//TODO desktop layout

//* app features:
//* uses bloc 8
//* rest api
//* desktop and mobile layouts
//* localization (eng, ru)
//* dark and light themes
//* null-safety