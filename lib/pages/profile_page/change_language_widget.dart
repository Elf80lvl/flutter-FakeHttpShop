import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/locale/locale_bloc.dart';
import '../../generated/l10n.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) {
        return ListTile(
          title: Text(S.of(context).language),
          subtitle: Text(localeState.appLocale.toString().substring(0, 2)),
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  final locales = S.delegate.supportedLocales;
                  final bloc = BlocProvider.of<LocaleBloc>(context);
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: locales.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(locales[index].toString()),
                          onTap: () {
                            bloc.add(LocaleChangeLocaleEvent(locales[index]));
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                });
          },
        );
      },
    );
  }
}
