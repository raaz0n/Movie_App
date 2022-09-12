part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentIndex;
  const MovieTabChangedEvent({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
