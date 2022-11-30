import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/domain/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/usecases/get_top_rated.dart';
import 'package:movie_app/presentation/bloc/similar_movies/similar_movies_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/moive_repositories_impl.dart';
import '../domain/repositories/movie_repositories.dart';
import '../domain/usecases/check_if_favorite_movie.dart';
import '../domain/usecases/delete_favorite_movie.dart';
import '../domain/usecases/get_cast.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_favorite_movie.dart';
import '../domain/usecases/get_movie_details.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/get_video.dart';
import '../domain/usecases/save_movie.dart';
import '../presentation/bloc/cast_bloc/cast_bloc.dart';
import '../presentation/bloc/favorite_bloc/favorite_bloc.dart';
import '../presentation/bloc/language_bloc/language_bloc.dart';
import '../presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/bloc/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/bloc/movie_detail/movie_detail_bloc_bloc.dart';
import '../presentation/bloc/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/bloc/video_bloc/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  //! provider

  //get trending provider
  // getItInstance.registerFactory(() => GetTrendingProvider(getItInstance()));

  //! Bloc

  //movie carousel bloc
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  //movie backdrop bloc
  getItInstance.registerFactory(
    () => MovieBackdropBloc(),
  );

  //movie tabbed bloc
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
        getTopRated: getItInstance()),
  );

  //Language bloc
  getItInstance.registerLazySingleton<LanguageBloc>(
    () => LanguageBloc(),
  );

  // movie detail bloc
  getItInstance.registerFactory<MovieDetailBlocBloc>(
    () => MovieDetailBlocBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );

  //cast bloc
  getItInstance.registerFactory<CastBloc>(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );

  //similar movie bloc
  getItInstance.registerFactory<SimilarMoviesBloc>(
    () => SimilarMoviesBloc(
      getSimilarMovies: getItInstance(),
    ),
  );

  //video bloc
  getItInstance.registerFactory<VideosBloc>(
    () => VideosBloc(
      getItInstance(),
    ),
  );

  //favorite bloc
  getItInstance.registerFactory<FavoriteBloc>(
    () => FavoriteBloc(
      getItInstance(),
      getItInstance(),
      getItInstance(),
      getItInstance(),
    ),
  );

  //! core
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );

  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance(),
    ),
  );

  //! feature
  //remote data source
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      getItInstance(),
    ),
  );

  //movie local data source
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  //usecase
  getItInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPopular>(
    () => GetPopular(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetComingSoon>(
    () => GetComingSoon(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetTopRated>(
    () => GetTopRated(
      getItInstance(),
    ),
  );

  //movie Detail Usecase

  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(
      getItInstance(),
    ),
  );

  // cast usecase

  getItInstance.registerLazySingleton<GetCast>(
    () => GetCast(
      getItInstance(),
    ),
  );

  //video usecase
  getItInstance.registerLazySingleton<GetVideo>(
    () => GetVideo(
      getItInstance(),
    ),
  );

  //similar movies use case
  getItInstance.registerLazySingleton<GetSimilarMovies>(
    () => GetSimilarMovies(
      getItInstance(),
    ),
  );

  //hive database use case

  getItInstance.registerLazySingleton<SaveMovie>(
    () => SaveMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
    () => GetFavoriteMovies(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<CheckIfFaviteMovies>(
    () => CheckIfFaviteMovies(
      getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
    () => DeleteFavoriteMovie(
      getItInstance(),
    ),
  );

  //repository
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );
}
