import 'package:bloc/bloc.dart';
import 'package:e_com_bloc/utils/app_shared_preference.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  Future<void> readLanguage() async {
    /// Get to SharedPreferences
    try {
      var language = AppSharedPreference.getAppLanguage();
      log("==== App Current Lang: $language");
      if (language == "en") {
        emit(LanguageLoaded(Locale('en', 'US'), "EN", "en"));
      } else if (language == "kh") {
        emit(LanguageLoaded(Locale('kh', 'KH'), "KH", "kh"));
      } else {
        emit(LanguageLoaded(Locale('kh', 'KH'), "KH", "kh"));
      }
    } catch (ex) {
      emit(LanguageLoaded(Locale('kh', 'KH'), "KH", "kh"));
    }
  }
  void changeLanguage(Locale locale, String type, String lanCode) {
    /// Save to SharedPreferences
    AppSharedPreference.setAppLanguage(lanCode);
    emit(LanguageLoaded(locale, type, lanCode));
  }
}
