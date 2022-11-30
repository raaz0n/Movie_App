import 'package:movie_app/common/constants/translation_constants.dart';

import 'tab.dart';

class MovieTabbedConstants {
  static List<Tab> movieTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.soon),
    Tab(index: 3, title: TranslationConstants.top),
  ];
}
