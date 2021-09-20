import 'package:equatable/equatable.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => <Object>[];
}

class LanguageInitial extends LanguageState {
  @override
  String toString() => 'LanguageInitial';
}

class LanguageLoading extends LanguageState {}

// ignore: must_be_immutable
class LanguageChanged extends LanguageState {
  LanguageChanged({required this.language});
  String language;

  @override
  List<Object> get props => <Object>[language];
}

class LanguageFailure extends LanguageState {
  const LanguageFailure({required this.error});
  final String error;

  @override
  List<Object> get props => <Object>[error];

  @override
  String toString() => 'LanguageFailure { error: $error }';
}
