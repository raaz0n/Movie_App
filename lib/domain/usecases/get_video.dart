import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/watch_video_Entity.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetVideo extends UseCase<List<WatchVideoEntity>, MovieParams> {
  final MovieRepository movieRepository;
  GetVideo(this.movieRepository);

  @override
  Future<Either<AppError, List<WatchVideoEntity>>> call(MovieParams params) async {
    return await movieRepository.getVideo(params.id);
  }
}
