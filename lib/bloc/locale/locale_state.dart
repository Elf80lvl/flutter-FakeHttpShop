part of 'locale_bloc.dart';

class LocaleState {
  final Locale appLocale;

  LocaleState(this.appLocale);
}

class LocaleInitial extends LocaleState {
  LocaleInitial() : super(const Locale('en'));
}
