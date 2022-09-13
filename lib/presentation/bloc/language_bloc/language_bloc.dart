import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(
          LanguageChanged(
            Locale(Languages.languages[0].code),
          ),
        ) {
    on<LanguageEvent>((event, emit) async {
      if (event is LanguageChangedEvent) {
        emit(
          LanguageChanged(
            Locale(event.languageEntity.code),
          ),
        );
      }
    });
  }
}
