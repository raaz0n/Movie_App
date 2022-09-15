part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastError extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> castEntity;

  const CastLoaded(this.castEntity);

  @override
  List<Object> get props => [castEntity];
}
