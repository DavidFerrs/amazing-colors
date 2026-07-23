
// ignore_for_file: public_member_api_docs, no_magic_number, member_ordering
import 'dart:convert';

import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'color_model.g.dart';

/// The Color model
@HiveType(typeId: 1)
class ColorModel extends HiveObject {
  /// Hex string represents the color
  @HiveField(0)
  final String hex;

  /// Time of creation
  @HiveField(1)
  final DateTime creationDate;

  /// If the user favorites the color
  @HiveField(2)
  final bool isFavorite;

  /// Creates a [ColorModel]
  ColorModel({
    required this.hex,
    required this.creationDate,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return hex;
  }

  // ---- Entity ----

  ColorEntity toEntity() {
    return ColorEntity(
      hex: hex,
      creationDate: creationDate,
      isFavorite: isFavorite,
    );
  }

  factory ColorModel.fromEntity(ColorEntity entity) {
    return ColorModel(
      hex: entity.hex,
      creationDate: entity.creationDate,
      isFavorite: entity.isFavorite,
    );
  }

  // ---- Serialization ----

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hex': hex,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'isFavorite': isFavorite,
    };
  }

  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      hex: map['hex'] as String,
      creationDate: DateTime.fromMillisecondsSinceEpoch(
        map['creationDate'] as int,
      ),
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorModel.fromJson(String source) =>
      ColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
