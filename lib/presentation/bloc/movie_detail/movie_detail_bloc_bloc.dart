import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/usecases/get_movie_details.dart';
import 'package:movie_app/presentation/bloc/cast_bloc/cast_bloc.dart';

import '../../../domain/entities/movie_details_entity.dart';

part 'movie_detail_bloc_event.dart';
part 'movie_detail_bloc_state.dart';

class MovieDetailBlocBloc
    extends Bloc<MovieDetailBlocEvent, MovieDetailBlocState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  MovieDetailBlocBloc({required this.getMovieDetail, required this.castBloc})
      : super(MovieDetailBlocInitial()) {
    on<MovieDetailBlocEvent>((event, emit) async {
      if (event is MovieDetailLoadEvent) {
        final movie = await getMovieDetail(MovieParams(event.movieId));
        emit(
          movie.fold(
            (l) => MovieDetailBlocError(),
            (movie) => MovieDetailBlocLoaded(movieDetailsEntity: movie),
          ),
        );

        castBloc.add(CastLoadEvent(event.movieId));
      }
    });
  }
}
