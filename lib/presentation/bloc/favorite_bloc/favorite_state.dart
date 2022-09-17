part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMovieLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  const FavoriteMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMovieError extends FavoriteState {}

class IsFavoriteMovie extends FavoriteState {
  final bool isMovieFavorite;

  const IsFavoriteMovie(this.isMovieFavorite);
  @override
  List<Object> get props => [isMovieFavorite];
}
