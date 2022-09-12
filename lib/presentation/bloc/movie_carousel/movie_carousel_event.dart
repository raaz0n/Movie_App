part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  int defaultIndex;
  CarouselLoadEvent({this.defaultIndex = 0});

  @override
  List<Object> get props => [defaultIndex];
}
