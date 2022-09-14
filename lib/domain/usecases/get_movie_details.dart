import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailsEntity, MovieParams> {
  final MovieRepository movieRepository;
  GetMovieDetail(this.movieRepository);

  @override
  Future<Either<AppError, MovieDetailsEntity>> call(MovieParams params) async {
    return await movieRepository.getMovieDetails(params.id);
  }
}
