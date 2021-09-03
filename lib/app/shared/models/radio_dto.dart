import 'package:equatable/equatable.dart';

class RadioDto extends Equatable {
  final String id;
  final String text;

  RadioDto({
    required this.id,
    required this.text,
  });

  @override
  List<Object?> get props => [this.id];
}
