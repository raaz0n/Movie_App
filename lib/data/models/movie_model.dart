import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

@immutable
class MovieModel extends MovieEntity {
  final int? voteCount;
  @override
  final int id;
  final String? originalTitle;
  @override
  final String posterPath;
  final bool? video;
  @override
  final double voteAverage;
  @override
  final String? overview;
  @override
  final String releaseDate;
  @override
  final String title;
  final bool? adult;
  @override
  final String backdropPath;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? mediaType;

  const MovieModel(
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
      posterPath: json['poster_path'] ?? "/xUWf5xX0AnZgAnYXAMk03zTbsef.jpg",
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? "/xUWf5xX0AnZgAnYXAMk03zTbsef.jpg",
      originalLanguage: json['original_language'] ?? "",
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vote_count'] = voteCount;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}
