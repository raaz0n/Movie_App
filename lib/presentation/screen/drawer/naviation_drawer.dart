import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/screen/app_localization.dart';

import '../../../common/constants/size_constant.dart';
import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

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
              child: Expanded(
                  child: Image.asset(
                "assets/pngs/logo.png",
                height: getProportionateScreenWidth(Sizes.dimen_200),
              )),
            ),
            NavigationListItem(
              title:
                  "${AppLocalizations.of(context)!.translate(TranslationConstants.favoriteMovies)}",
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: AppLocalizations.of(context)!
                  .translate(TranslationConstants.language)
                  .toString(),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(LanguageChangedEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(
              title: AppLocalizations.of(context)!
                  .translate(TranslationConstants.feedback)
                  .toString(),
              onPressed: () {
                log("message");
              },
            ),
            NavigationListItem(
              title: AppLocalizations.of(context)!
                  .translate(TranslationConstants.about)
                  .toString(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
