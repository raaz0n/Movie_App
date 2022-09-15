import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  //movie detail
  Future<Either<AppError,MovieDetailsEntity>> getMovieDetails(int id);
  //cast
    Future<Either<AppError, List<CastEntity>>> getCast(int id);

}

