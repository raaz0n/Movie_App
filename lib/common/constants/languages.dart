import 'package:movie_app/domain/entities/language_entity.dart';

class Languages {
  Languages._();
  static final languages = [
    LanguageEntity(code: 'en', value: "English"),
    LanguageEntity(code: 'es', value: "Spanish"),
    LanguageEntity(code: 'ne', value: "नेपाली"),
    LanguageEntity(code: 'fr', value: "French"),
    LanguageEntity(code: 'ja', value: "Japanese "),

  ];
}
