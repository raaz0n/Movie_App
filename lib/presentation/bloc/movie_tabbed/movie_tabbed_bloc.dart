import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc(
      {required this.getPopular,
      required this.getPlayingNow,
      required this.getComingSoon})
      : super(const MovieTabbedInitial(currentIndex: 1)) {
    on<MovieTabbedEvent>((event, emit) async {
      if (event is MovieTabChangedEvent) {
        Either<AppError, List<MovieEntity>>? movieEither;
        switch (event.currentIndex) {
          case 0:
            movieEither = await getPopular(NoParams());
            break;
          case 1:
            movieEither = await getPlayingNow(NoParams());
            break;
          case 3:
            movieEither = await getPopular(NoParams());
            break;
        }
        emit(
          movieEither!.fold(
            (l) => MovieTabLoadError(currentIndex: event.currentIndex),
            (movies) => MovieTabChanged(
                movies: movies, currentIndex: event.currentIndex),
          ),
        );
      }
    });
  }
}
