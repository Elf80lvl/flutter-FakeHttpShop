import 'package:flutter/material.dart';

import 'change_language_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ChangeLanguageWidget(),
        ],
      ),
    );
  }
}
