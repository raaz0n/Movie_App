import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;
  const AppError(this.message);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [message];
}
