part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  // @override
  // List<Object> get props => [];
}

class LoadFavoriteMovieEvent extends FavoriteEvent{
  @override
  List<Object?> get props => [];

}

class DeleteFavoriteMovieEvent extends FavoriteEvent{
  final int movieId ;

  const DeleteFavoriteMovieEvent(this.movieId);
  
  @override
  List<Object?> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  const ToggleFavoriteMovieEvent(this.movieEntity, this.isFavorite);

  @override
  List<Object?> get props => [movieEntity, isFavorite];
}


class CheckFavoriteMovieEvent extends FavoriteEvent{
  final int movieId;

  const CheckFavoriteMovieEvent(this.movieId);
  
  @override
  List<Object?> get props =>[movieId];
}



