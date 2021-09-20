import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../enums/app_languages.dart';
import '../../repository/language_repository.dart';
import '../../utilities/index.dart';
import 'language_event.dart';
import 'language_state.dart';

@singleton
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this._languageRepository, this._logger) : super(LanguageInitial());
  final LanguageRepository _languageRepository;
  final AppLogger _logger;

  static String lang = AppLanguages.english.value;

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageAppStartEvent) {
      yield* onAppStart(event);
    } else if (event is LanguageChangeEvent) yield* changeLanguage(event);
  }

  Stream<LanguageState> changeLanguage(LanguageChangeEvent event) async* {
    yield LanguageLoading();
    lang = event.lang;
    await _languageRepository.saveLang(lang);
    yield LanguageChanged(language: event.lang);
  }

  Stream<LanguageState> onAppStart(LanguageAppStartEvent event) async* {
    yield LanguageLoading();
    final String? result = await _languageRepository.hasLang();
    lang = result ?? AppLanguages.english.value;
    yield LanguageChanged(language: result ?? AppLanguages.english.value);
  }
}
