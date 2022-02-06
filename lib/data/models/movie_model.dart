import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int? voteCount;
  final int id;
  final String? originalTitle;
  final String posterPath;
  final bool? video;
  final double voteAverage;
  final String? overview;
  final String releaseDate;
  final String title;
  final bool? adult;
  final String backdropPath;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? mediaType;

  MovieModel(
      {this.voteCount,
      required this.id,
      this.originalTitle,
      required this.posterPath,
      this.video,
      required this.voteAverage,
      this.overview,
      required this.releaseDate,
      required this.title,
      this.adult,
      required this.backdropPath,
      this.originalLanguage,
      this.genreIds,
      this.popularity,
      this.mediaType})
      : super(
          id: id,
          title: title,
          posterPath: posterPath,
          releaseDate: releaseDate,
          backdropPath: backdropPath,
          overview: overview,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      voteCount: json['vote_count'],
      id: json['id'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
