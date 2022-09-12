import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../../common/constants/size_constant.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

   NavigationListItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationSubListItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(Sizes.dimen_32)),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
