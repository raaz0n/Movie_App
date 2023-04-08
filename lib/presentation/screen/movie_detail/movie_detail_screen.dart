import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/language_const.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/dependency_injection/get_it.dart';
import 'package:movie_app/presentation/bloc/movie_detail/movie_detail_bloc_bloc.dart';
import 'package:movie_app/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:movie_app/presentation/screen/movie_detail/movie_detail_argument.dart';
import 'package:movie_app/presentation/screen/movie_detail/video_widget.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

import '../../../common/constants/size_constant.dart';
import '../../../common/screenUtils/size_config.dart';
import '../../bloc/cast_bloc/cast_bloc.dart';
import '../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../bloc/video_bloc/videos_bloc.dart';
import '../../widgets/big_poster.dart';
import 'cast_list_widget.dart';
import 'similar_movie_list_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailArguments movieDetailArguments;
  MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBlocBloc movieDetailBlocBloc;
  late SimilarMoviesBloc similarMoviesBloc;
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;
  late FavoriteBloc _favoriteBloc;
  @override
  void initState() {
    movieDetailBlocBloc = getItInstance<MovieDetailBlocBloc>();
    similarMoviesBloc = getItInstance<SimilarMoviesBloc>();
    _castBloc = getItInstance<CastBloc>();
    _castBloc = movieDetailBlocBloc.castBloc;
    _videosBloc = movieDetailBlocBloc.videosBloc;
    _favoriteBloc = movieDetailBlocBloc.favoriteBloc;

    movieDetailBlocBloc
        .add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
    similarMoviesBloc
        .add(SimilarMovieLoadEvent(widget.movieDetailArguments.movieId));
    super.initState();
  }

  @override
  void dispose() {
    movieDetailBlocBloc.close();
    similarMoviesBloc.close();
    _castBloc.close();
    _videosBloc.close();
    _favoriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: movieDetailBlocBloc,
          ),
          BlocProvider.value(
            value: _castBloc,
          ),
          BlocProvider.value(
            value: _videosBloc,
          ),
          BlocProvider.value(
            value: _favoriteBloc,
          ),
          BlocProvider.value(
            value: similarMoviesBloc,
          )
        ],
        child: BlocBuilder<MovieDetailBlocBloc, MovieDetailBlocState>(
          builder: (context, state) {
            if (state is MovieDetailBlocLoaded) {
              final movieData = state.movieDetailsEntity;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigPoster(
                      movie: movieData,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getProportionateScreenWidth(Sizes.dimen_12)),
                      child: Text(
                        movieData.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          wordSpacing: 1.2,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Sizes.dimen_10, horizontal: Sizes.dimen_16),
                      child: Text(
                        getTranslated(context, TranslationConstants.cast)!,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.royalBlue),
                      ),
                    ),
                    const CastListWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Sizes.dimen_10, horizontal: Sizes.dimen_16),
                      child: Text(
                        getTranslated(
                            context, TranslationConstants.similarMovie)!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColor.royalBlue,
                            ),
                      ),
                    ),
                    const SimilarMovieListViewBuilder(),
                    VideoWidget(videosBloc: _videosBloc)
                  ],
                ),
              );
            } else if (state is MovieDetailBlocError) {
              return Container();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
