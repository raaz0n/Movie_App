import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/watch_video_Entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, List<MovieEntity>>> getTopRated();
  Future<Either<AppError, List<MovieEntity>>> getSimilarMovies(int id);

  //movie detail
  Future<Either<AppError, MovieDetailsEntity>> getMovieDetails(int id);
  //cast
  Future<Either<AppError, List<CastEntity>>> getCast(int id);

  //watch video
  Future<Either<AppError, List<WatchVideoEntity>>> getVideo(int id);

  //hive database
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getFaviteMovies();
  Future<Either<AppError, void>> deleteFaviteMovies(int movieId);
  Future<Either<AppError, bool>> checkIfFaviteMovies(int movieId);
}
