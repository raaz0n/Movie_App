import 'package:equatable/equatable.dart';

class WatchVideoEntity extends Equatable {
  final String name, key, type;

  const WatchVideoEntity({
    required this.name,
    required this.key,
    required this.type,
  });

  @override
  List<Object?> get props => [name];

  @override
  bool get stringify => true;
}
