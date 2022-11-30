part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();

  @override
  List<Object> get props => [];
}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> similarMovies;
  const SimilarMoviesLoaded(this.similarMovies);

  @override
  List<Object> get props => [similarMovies];
}

class SimilarMoviesError extends SimilarMoviesState {}
