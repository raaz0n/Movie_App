import 'package:hive/hive.dart';
import 'package:movie_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(Movietable movietable);
  Future<List<Movietable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkFavorite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkFavorite(int movieId) async {
    final movieBox = await Hive.openBox("movieBox");
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox("movieBox");
    await movieBox.delete(movieId);
  }

  @override
  Future<List<Movietable>> getMovies() async {
    final movieBox = await Hive.openBox("movieBox");
    final movieIds = movieBox.keys;
    final List<Movietable> movies = [];
    for (var movieId in movieIds) {
      movies.add(movieBox.get(movieId));
    }
    return movies;
  }

  @override
  Future<void> saveMovie(Movietable movietable) async {
    final movieBox = await Hive.openBox("movieBox");
    await movieBox.put(movietable.id, movietable);
  }
}
