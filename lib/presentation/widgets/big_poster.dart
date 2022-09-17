import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

import '../../data/core/api_constant.dart';
import 'movie_detail_appbar.dart';

class BigPoster extends StatelessWidget {
  MovieDetailsEntity movie;
  BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ])),
          child: Image.network(
            "${ApiConstant.ITEM_LIST}${movie.posterPath}",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          // top: 100,
          bottom: 0,
          left: 0,
          right: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              movie.releaseDate,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              movie.voteAverage.toString(),
              style: const TextStyle(color: AppColor.violet),
            ),
          ),
        ),
        Positioned(
            left: getProportionateScreenWidth(Sizes.dimen_16),
            right: getProportionateScreenWidth(Sizes.dimen_16),
            child:  MovieDetailAppBar(movieDetailsEntity: movie,))
      ],
    );
  }
}
