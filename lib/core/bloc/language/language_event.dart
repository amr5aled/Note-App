import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => <Object>[];
}

class LanguageAppStartEvent extends LanguageEvent {}

class LanguageChangeEvent extends LanguageEvent {
  const LanguageChangeEvent({required this.lang});
  final String lang;

  @override
  List<Object> get props => <Object>[lang];
}
