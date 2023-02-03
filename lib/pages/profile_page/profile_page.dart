import 'package:flutter/material.dart';

import '../../const.dart';
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
            children: const [
              ChangeLanguageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
