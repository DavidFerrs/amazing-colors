
// ignore_for_file: public_member_api_docs

import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:hive_ce/hive.dart';

abstract interface class ColorRepository {
  Future<void> save(ColorEntity color);

  Future<void> update(ColorEntity color);

  Future<void> delete(String id);

  Future<ColorEntity?> findById(String id);

  Future<List<ColorEntity>> findAll();

  Future<List<ColorEntity>> findPage({
    required int page,
    int limit = 20,
  });

  Stream<BoxEvent> watch();
}
