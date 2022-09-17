import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class CheckIfFaviteMovies extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;
  CheckIfFaviteMovies(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepository.checkIfFaviteMovies(params.id);
  }
}
