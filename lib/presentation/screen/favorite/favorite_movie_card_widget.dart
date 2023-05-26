import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../../common/constants/size_constant.dart';
import '../../../common/core/api_constant.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../bloc/favorite_bloc/favorite_bloc.dart';
import '../movie_detail/movie_detail_argument.dart';
import '../movie_detail/movie_detail_screen.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenHeight(Sizes.dimen_8)),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(getProportionateScreenHeight(Sizes.dimen_8)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieDetailArguments: MovieDetailArguments(movie.id),
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              getProportionateScreenHeight(Sizes.dimen_8)),
          child: Stack(
            children: [
              Image.network(
                '${ApiConstant.ITEM_LIST}${movie.posterPath}',
                fit: BoxFit.cover,
                width: getProportionateScreenHeight(Sizes.dimen_100),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context)
                      .add(DeleteFavoriteMovieEvent(movie.id)),
                  child: Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(Sizes.dimen_12)),
                    child: Icon(
                      Icons.delete,
                      size: getProportionateScreenHeight(Sizes.dimen_18),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
