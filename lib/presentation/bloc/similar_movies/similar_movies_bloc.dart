import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/usecases/get_similar_movies.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  GetSimilarMovies getSimilarMovies;
  SimilarMoviesBloc({required this.getSimilarMovies})
      : super(SimilarMoviesInitial()) {
    on<SimilarMoviesEvent>((event, emit) async {
      if (event is SimilarMovieLoadEvent) {
        final similarMovie =
            await getSimilarMovies(MovieParams(event.similarMovieId));

        emit(
          similarMovie.fold(
            (l) => SimilarMoviesError(),
            (r) => SimilarMoviesLoaded(r),
          ),
        );
      }
    });
  }
}
