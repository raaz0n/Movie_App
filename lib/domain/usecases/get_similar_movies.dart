import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetSimilarMovies extends UseCase<List<MovieEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetSimilarMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieParams params) async {
    return await movieRepository.getSimilarMovies(params.id);
  }
}
