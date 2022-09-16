import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/moive_repositories_impl.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/get_cast.dart';
import 'package:movie_app/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/bloc/cast_bloc/cast_bloc.dart';
import 'package:movie_app/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_detail/movie_detail_bloc_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_tabbed/movie_tabbed_bloc.dart';

import '../domain/usecases/get_movie_details.dart';
import '../presentation/bloc/movie_carousel/movie_carousel_bloc.dart';

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
  getItInstance.registerFactory(() => MovieBackdropBloc());

  //movie tabbed bloc
  getItInstance.registerFactory(() => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance()));

  //Language bloc
  getItInstance.registerLazySingleton<LanguageBloc>(() => LanguageBloc());

  // movie detail bloc
  getItInstance.registerFactory<MovieDetailBlocBloc>(
    () => MovieDetailBlocBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
    ),
  );

  //cast bloc
  getItInstance
      .registerFactory<CastBloc>(() => CastBloc(getCast: getItInstance()));

  //! core
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //! feature
  //remote data source
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  //usecase
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  //movie Detail Usecase

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  // cast usecase

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  //repository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));
}
