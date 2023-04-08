import 'dart:convert';

import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/movie_cast_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?> getTrending();
  Future<List<MovieModel>?> getPopular();
  Future<List<MovieModel>?> getComingSoon();
  Future<List<MovieModel>?> getPlayingNow();
  Future<List<MovieModel>?> getTopRated();
  Future<MovieDetailModel?> getMovieDetails(int id);
  Future<List<CastModel>?> getCast(int id);
  Future<List<VideoModel>?> getVideo(int id);
  Future<List<MovieModel>?> getSimilarMovies(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  @override
  Future<List<MovieModel>?> getTrending() async {
    final response = await _client.get(
      path: "trending/movie/day",
      headers: headers,
    );
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPopular() async {
    final response = await _client.get(
      path: "movie/popular",
      headers: headers,
    );
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getComingSoon() async {
    final response = await _client.get(
      path: "movie/upcoming",
      headers: headers,
    );
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPlayingNow() async {
    final response =
        await _client.get(path: "movie/now_playing", headers: headers);
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getTopRated() async {
    final response =
        await _client.get(path: "movie/top_rated", headers: headers);
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }

  @override
  Future<MovieDetailModel?> getMovieDetails(int id) async {
    final response = await _client.get(
      path: "movie/$id",
      headers: headers,
    );
    final object = json.decode(response.body);
    final movie = MovieDetailModel.fromJson(object);
    return movie;
  }

  @override
  Future<List<CastModel>?> getCast(int id) async {
    final response = await _client.get(
      path: "movie/$id/credits",
      headers: headers,
    );
    final object = json.decode(response.body);
    final cast = CastResultModel.fromJson(object).cast;
    return cast;
  }

  @override
  Future<List<VideoModel>?> getVideo(int id) async {
    final response = await _client.get(
      path: "movie/$id/videos",
      headers: headers,
    );
    final object = json.decode(response.body);
    final video = VideoResultModel.fromJson(object).vidoes;
    return video;
  }

  @override
  Future<List<MovieModel>?> getSimilarMovies(int id) async {
    final response =
        await _client.get(path: "movie/$id/similar", headers: headers);
    final object = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(object).movies;
    return movies;
  }
}
