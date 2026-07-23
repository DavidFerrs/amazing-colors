// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final String hex;
  final DateTime creationDate;
  final bool isFavorite;

  @override
  List<Object?> get props => [
    hex,
    creationDate,
    isFavorite,
  ];

  const ColorEntity({
    required this.hex,
    required this.creationDate,
    this.isFavorite = false,
  });

  ColorEntity copyWith({
    String? hex,
    DateTime? creationDate,
    bool? isFavorite,
  }) {
    return ColorEntity(
      hex: hex ?? this.hex,
      creationDate: creationDate ?? this.creationDate,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
