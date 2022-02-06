import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/data/data_sources/movies_result_model.dart';
import 'package:movie_app/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getCommingSoon();
  Future<List<MovieModel>> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get("trending/movie/day");
    print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies: $movies");
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get("movie/popular");
    print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies: $movies");
    return movies!;
  }

  @override
  Future<List<MovieModel>> getCommingSoon() async {
    final response = await _client.get("movie/upcoming");
    print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies: $movies");
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies: $movies");
    return movies!;
  }
}