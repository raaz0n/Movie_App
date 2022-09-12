part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentIndex;
  const MovieTabbedState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({required int currentIndex})
      : super(currentIndex: currentIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({required this.movies, required int currentIndex})
      : super(currentIndex: currentIndex);
}

class MovieTabLoadError extends MovieTabbedState {
  const MovieTabLoadError({required int currentIndex})
      : super(currentIndex: currentIndex);
}
