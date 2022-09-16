part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class VideoLoadEvent extends VideosEvent {
  final int movieId;

  const VideoLoadEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
