part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class VideosLoading extends VideosState {}

class VideosLoaded extends VideosState {
  final List<WatchVideoEntity> vidoes;

  const VideosLoaded(this.vidoes);

  @override
  List<Object> get props => [vidoes];
}

class VideosError extends VideosState {}
