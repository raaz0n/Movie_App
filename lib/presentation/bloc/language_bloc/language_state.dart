part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

// class LanguageInitial extends LanguageState {
//   final Locale locale;
//   const LanguageInitial(this.locale);

//   @override
//   List<Object> get props => [locale.languageCode];
// }

class LanguageChanged extends LanguageState {
  final Locale locale;
  const LanguageChanged(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {}
