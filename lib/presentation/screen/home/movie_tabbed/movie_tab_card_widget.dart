

import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/data/core/api_constant.dart';

import '../../../../common/constants/size_constant.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(Sizes.dimen_16)),
              child: Image.network(
                '${ApiConstant.ITEM_LIST}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(Sizes.dimen_4)),
            child: Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
