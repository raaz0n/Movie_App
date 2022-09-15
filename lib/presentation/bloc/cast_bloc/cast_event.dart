part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class CastLoadEvent extends CastEvent {
  final int movieId;

  const CastLoadEvent({required this.movieId});
  
  @override
  List<Object> get props => [movieId];
}
