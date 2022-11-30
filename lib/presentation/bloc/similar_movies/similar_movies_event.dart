part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();

  @override
  List<Object> get props => [];
}

class SimilarMovieLoadEvent extends SimilarMoviesEvent {
  final int similarMovieId;
  const SimilarMovieLoadEvent(this.similarMovieId);
  @override
  List<Object> get props => [similarMovieId];
}
