import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/watch_video_Entity.dart';
import 'package:movie_app/domain/usecases/get_video.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideo getVideo;
  VideosBloc(this.getVideo) : super(VideosInitial()) {
    on<VideosEvent>(
      (event, emit) async {
        if (event is VideoLoadEvent) {
          final eitherMovie = await getVideo(MovieParams(event.movieId));
          emit(eitherMovie.fold((l) => VideosError(), (r) => VideosLoaded(r)));
        }
      },
    );
  }
}
