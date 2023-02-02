part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class LocaleChangeLocaleEvent extends LocaleEvent {
  final Locale locale;
  const LocaleChangeLocaleEvent(this.locale);

  @override
  List<Object> get props => [locale];
}
