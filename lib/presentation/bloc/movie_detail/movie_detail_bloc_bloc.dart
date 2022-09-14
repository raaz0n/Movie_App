import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/usecases/get_movie_details.dart';

import '../../../domain/entities/movie_details_entity.dart';

part 'movie_detail_bloc_event.dart';
part 'movie_detail_bloc_state.dart';

class MovieDetailBlocBloc
    extends Bloc<MovieDetailBlocEvent, MovieDetailBlocState> {
  final GetMovieDetail getMovieDetail;
  MovieDetailBlocBloc({required this.getMovieDetail}) : super(MovieDetailBlocInitial()) {
    on<MovieDetailBlocEvent>((event, emit) async {
      if (event is MovieDetailLoadEvent) {
        final movie = await getMovieDetail(MovieParams(event.movieId));
        emit(movie.fold((l) => MovieDetailBlocError(),
            (movie) => MovieDetailBlocLoaded(movieDetailsEntity: movie)));
      }
    });
  }
}
