import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_local_data_source.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_cast_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/watch_video_Entity.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';

import '../tables/movie_table.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;
  MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetails(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetails(id);
      return Right(movie!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCast(int id) async {
    try {
      final castCrew = await remoteDataSource.getCast(id);
      return Right(castCrew!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<WatchVideoEntity>>> getVideo(int id) async {
    try {
      final video = await remoteDataSource.getVideo(id);
      return Right(video!);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfFaviteMovies(int movieId) async {
    try {
      final response = await localDataSource.checkFavorite(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFaviteMovies(int movieId) async {
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFaviteMovies() async {
    try {
      final response = await localDataSource.getMovies();
      return Right(response);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      final response = await localDataSource
          .saveMovie(Movietable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception {
      return Left(AppError("something Want Wroung"));
    }
  }
}
