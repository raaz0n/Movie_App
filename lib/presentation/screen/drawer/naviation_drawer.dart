import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

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
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: 'Language',
              children: const ['English', 'Spanish'],
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
