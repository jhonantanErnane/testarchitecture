import 'package:equatable/equatable.dart';

class GenderDto extends Equatable {
  final String id;
  final String name;

  GenderDto({required this.id, required this.name});

  @override
  List<Object?> get props => [this.id];
}
