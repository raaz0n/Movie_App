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
  Future<MovieDetailModel?> getMovieDetails(int id);
  Future<List<CastModel>?> getCast(int id);
  Future<List<VideoModel>?> getVideo(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>?> getTrending() async {
    final response = await _client.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).movies;
    // print("movies: $movies");
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPopular() async {
    final response = await _client.get("movie/popular");
    // print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>?> getComingSoon() async {
    final response = await _client.get("movie/upcoming");
    // print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    // print("movies: $movies");
    return movies;
  }

  @override
  Future<List<MovieModel>?> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    // print(response);
    final movies = MoviesResultModel.fromJson(response).movies;
    // print("movies: $movies");
    return movies;
  }

  @override
  Future<MovieDetailModel?> getMovieDetails(int id) async {
    final response = await _client.get("movie/$id");
    final movie = MovieDetailModel.fromJson(response);
    return movie;
  }

  @override
  Future<List<CastModel>?> getCast(int id) async {
    final response = await _client.get("movie/$id/credits");
    final cast = CastResultModel.fromJson(response).cast;
    return cast;
  }

  @override
  Future<List<VideoModel>?> getVideo(int id) async {
    final response = await _client.get("movie/$id/videos");
    final video = VideoResultModel.fromJson(response).vidoes;
    return video;
  }
}
