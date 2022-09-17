import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/check_if_favorite_movie.dart';
import 'package:movie_app/domain/usecases/delete_favorite_movie.dart';
import 'package:movie_app/domain/usecases/get_favorite_movie.dart';
import 'package:movie_app/domain/usecases/save_movie.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  GetFavoriteMovies getFavoriteMovies;
  SaveMovie saveMovie;
  CheckIfFaviteMovies checkIfFaviteMovies;
  DeleteFavoriteMovie deleteFavoriteMovie;
  FavoriteBloc(this.getFavoriteMovies, this.saveMovie, this.deleteFavoriteMovie,
      this.checkIfFaviteMovies)
      : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is ToggleFavoriteMovieEvent) {
        if (event.isFavorite) {
          await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
        } else {
          await saveMovie(event.movieEntity);
        }
        final response =
            await checkIfFaviteMovies(MovieParams(event.movieEntity.id));
        emit(
          response.fold(
            (l) => FavoriteMovieError(),
            (r) => IsFavoriteMovie(r),
          ),
        );
      } else if (event is LoadFavoriteMovieEvent) {
        final response = await getFavoriteMovies(
          NoParams(),
        );

        emit(
          response.fold(
            (l) => FavoriteMovieError(),
            (r) => FavoriteMovieLoaded(r),
          ),
        );
      } else if (event is DeleteFavoriteMovieEvent) {
        await deleteFavoriteMovie(
          MovieParams(event.movieId),
        );
        final response = await getFavoriteMovies(
          NoParams(),
        );
        emit(
          response.fold(
            (l) => FavoriteMovieError(),
            (r) => FavoriteMovieLoaded(r),
          ),
        );
      } else if (event is CheckFavoriteMovieEvent) {
        final response = await checkIfFaviteMovies(MovieParams(event.movieId));
        emit(response.fold(
            (l) => FavoriteMovieError(), (r) => IsFavoriteMovie(r)));
      }
    });
  }
}
