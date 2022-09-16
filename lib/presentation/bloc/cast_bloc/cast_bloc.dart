import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/usecases/get_cast.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  GetCast getCast;
  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<CastEvent>((event, emit) async {
      if (event is CastLoadEvent) {
        final castData = await getCast(MovieParams(event.movieId));

        emit(
          castData.fold(
            (l) => CastError(),
            (cast) => CastLoaded(cast),
          ),
        );
      }
    });
  }
}
