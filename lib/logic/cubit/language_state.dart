part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;
  final String languagesType;
  final String lan;

  LanguageLoaded(this.locale, this.languagesType, this.lan);
}
