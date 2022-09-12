import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../domain/entities/no_params.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  MovieBackdropBloc movieBackdropBloc;
  MovieCarouselBloc(
      {required this.getTrending, required this.movieBackdropBloc})
      : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        final moviesEither = await getTrending(NoParams());

        emit(
          moviesEither.fold((l) => MovieCarouselError(), (movies) {
            movieBackdropBloc
                .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
            return MovieCarouselLoaded(
              movies: movies,
              defaultIndex: event.defaultIndex,
            );
          }),
        );
      }
    });
  }
}
