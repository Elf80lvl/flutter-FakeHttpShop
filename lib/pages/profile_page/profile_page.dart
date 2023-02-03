import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/themes/theme_bloc.dart';
import '../../const.dart';
import '../../generated/l10n.dart';
import '../../widgets/desktop_top_menu.dart';
import 'change_language_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          constraints: const BoxConstraints(
            maxWidth: kDesktopMaxWidth,
          ),
          child: ListView(
            children: [
              const ChangeLanguageWidget(),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  final bloc = BlocProvider.of<ThemeBloc>(context);
                  final bool isDark;
                  if (themeState.theme == 'dark') {
                    isDark = true;
                  } else {
                    isDark = false;
                  }
                  return SwitchListTile(
                      title: Text(S.of(context).dark_theme),
                      subtitle:
                          Text(isDark ? S.of(context).on : S.of(context).off),
                      value: isDark,
                      onChanged: (value) {
                        if (value == false) {
                          bloc.add(ThemeToLight());
                        } else {
                          bloc.add(ThemeToDark());
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
