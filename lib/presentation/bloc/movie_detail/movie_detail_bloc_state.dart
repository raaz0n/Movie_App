part of 'movie_detail_bloc_bloc.dart';

abstract class MovieDetailBlocState extends Equatable {
  const MovieDetailBlocState();

  @override
  List<Object> get props => [];
}

class MovieDetailBlocInitial extends MovieDetailBlocState {}

class MovieDetailBlocLoading extends MovieDetailBlocState {}

class MovieDetailBlocError extends MovieDetailBlocState {}

class MovieDetailBlocLoaded extends MovieDetailBlocState {
  final MovieDetailsEntity movieDetailsEntity;

  const MovieDetailBlocLoaded({required this.movieDetailsEntity});

  @override
  List<Object> get props => [movieDetailsEntity];
}
