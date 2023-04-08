import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/language_const.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/size_constant.dart';
import '../favorite/favorite_screen.dart';
import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: getProportionateScreenWidth(Sizes.dimen_300),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(Sizes.dimen_8),
                bottom: getProportionateScreenHeight(Sizes.dimen_18),
                left: getProportionateScreenWidth(Sizes.dimen_8),
                right: getProportionateScreenWidth(Sizes.dimen_8),
              ),
              child: Image.asset(
                "assets/pngs/logo.png",
                height: getProportionateScreenWidth(Sizes.dimen_200),
              ),
            ),
            NavigationListItem(
              title:
                  getTranslated(context, TranslationConstants.favoriteMovies)!,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavoriteScreen(),
                  ),
                );
              },
            ),
            NavigationExpandedListItem(
              title: getTranslated(context, TranslationConstants.language)!,
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageChangedEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(
              title: getTranslated(context, TranslationConstants.feedback)!,
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: getTranslated(context, TranslationConstants.about)!,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
