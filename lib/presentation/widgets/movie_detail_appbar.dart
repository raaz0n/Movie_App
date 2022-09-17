import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import '../bloc/favorite_bloc/favorite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  MovieDetailsEntity movieDetailsEntity;
   MovieDetailAppBar({Key? key,required this.movieDetailsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: getProportionateScreenWidth(Sizes.dimen_20),
              ),
            ),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is IsFavoriteMovie) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<FavoriteBloc>(context).add(ToggleFavoriteMovieEvent(MovieEntity.fromMovieDetailEntity(movieDetailsEntity), state.isMovieFavorite));
                    },
                    child: Icon(
                      state.isMovieFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: getProportionateScreenWidth(Sizes.dimen_20),
                    ),
                  );
                } else {
                  return Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: getProportionateScreenWidth(Sizes.dimen_20),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
