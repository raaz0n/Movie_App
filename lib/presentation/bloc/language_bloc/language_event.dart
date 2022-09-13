part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChangedEvent extends LanguageEvent{
  final LanguageEntity languageEntity;
  const LanguageChangedEvent(this.languageEntity);

  @override
  List<Object> get props => [languageEntity.code];

}
