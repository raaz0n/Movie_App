import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository movieRepository;
  GetCast(this.movieRepository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await movieRepository.getCast(params.id);
  }
}
