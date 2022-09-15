import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/data/core/api_constant.dart';

import '../../../../common/constants/size_constant.dart';
import '../../movie_detail/movie_detail_argument.dart';
import '../../movie_detail/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius:
          BorderRadius.circular(getProportionateScreenWidth(Sizes.dimen_16)),
      child: GestureDetector(
        onTap: () {
          log(movieId.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movieId),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(Sizes.dimen_16)),
          child: Image.network(
            '${ApiConstant.ITEM_LIST}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
