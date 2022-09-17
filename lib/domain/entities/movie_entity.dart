import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_details_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String? overview;
  final String title;
  final String releaseDate;
  final num voteAverage;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailsEntity movieDetailsEntity) {
    return MovieEntity(
      id: movieDetailsEntity.id,
      title: movieDetailsEntity.title,
      posterPath: movieDetailsEntity.posterPath,
      backdropPath: movieDetailsEntity.backdropPath,
      voteAverage: movieDetailsEntity.voteAverage,
      releaseDate: movieDetailsEntity.releaseDate,
    );
  }
}
