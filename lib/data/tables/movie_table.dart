import 'package:hive/hive.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class Movietable extends MovieEntity {
  @override
  @HiveField(0)
  final int id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final String posterPath;

  const Movietable(
      {required this.id, required this.title, required this.posterPath})
      : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: "",
          voteAverage: 0,
          releaseDate: "",
        );

  factory Movietable.fromMovieEntity(MovieEntity movieEntity) {
    return Movietable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
    );
  }
}
