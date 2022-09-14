part of 'movie_detail_bloc_bloc.dart';

abstract class MovieDetailBlocEvent extends Equatable {
  const MovieDetailBlocEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailLoadEvent extends MovieDetailBlocEvent {
  final int movieId;

  const MovieDetailLoadEvent(this.movieId);
  @override
  List<Object> get props => [movieId];
}
