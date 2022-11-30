import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/common/screenUtils/size_config.dart';

import '../../../data/core/api_constant.dart';
import '../../bloc/similar_movies/similar_movies_bloc.dart';
import '../../themes/theme_color.dart';
import 'movie_detail_argument.dart';
import 'movie_detail_screen.dart';

class SimilarMovieListViewBuilder extends StatelessWidget {
  const SimilarMovieListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        if (state is SimilarMoviesLoaded) {
          return SizedBox(
            height: getProportionateScreenHeight(Sizes.dimen_230),
            child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.similarMovies.length,
                itemBuilder: (context, index) {
                  final similarMovie = state.similarMovies[index];
                  return SizedBox(
                    height: getProportionateScreenHeight(Sizes.dimen_150),
                    width: getProportionateScreenWidth(Sizes.dimen_160),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              movieDetailArguments:
                                  MovieDetailArguments(similarMovie.id),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: AppColor.vulcan,
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_8,
                          vertical: Sizes.dimen_4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              getProportionateScreenWidth(Sizes.dimen_8),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(Sizes.dimen_10)),
                                child: Image.network(
                                  '${ApiConstant.ITEM_LIST}${similarMovie.posterPath}',
                                  // fit: BoxFit.fitHeight,
                                  fit: BoxFit.cover,
                                  height: getProportionateScreenHeight(
                                      Sizes.dimen_100),
                                  width: getProportionateScreenWidth(
                                      Sizes.dimen_160),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.dimen_8,
                              ),
                              child: Text(
                                similarMovie.title,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        return const SizedBox.shrink();
      },
    );

    // return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
    //   builder: (context, state) {
    //     log(state.toString());
    //     if (state is SimilarMoviesLoaded) {
    //       return Padding(
    //         padding: EdgeInsets.symmetric(
    //             vertical: getProportionateScreenHeight(Sizes.dimen_6)),
    //         child: ListView.separated(
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           separatorBuilder: (context, index) {
    //             return SizedBox(
    //               width: getProportionateScreenWidth(Sizes.dimen_14),
    //             );
    //           },
    //           itemCount: state.similarMovies.length,
    //           itemBuilder: (context, index) {
    //             final MovieEntity movie = state.similarMovies[index];
    //             return MovieTabCardWidget(
    //               movieId: movie.id,
    //               posterPath: movie.posterPath,
    //               title: movie.title,
    //             );
    //           },
    //         ),
    //       );
    //     }
    //     return const SizedBox.shrink();
    //   },
    // );
  }
}
