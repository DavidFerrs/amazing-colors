import 'package:amazing_colors/app/modules/home/data/models/color_model.dart';
import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';
import 'package:hive_ce/hive.dart';

/// The implementation of the colors repository
class ColorRepositoryImpl implements ColorRepository {
  final Box<ColorModel> _box;

  /// Creates a [ColorRepositoryImpl]
  const ColorRepositoryImpl(this._box);

  @override
  Future<void> save(ColorEntity entity) async {
    final model = ColorModel.fromEntity(entity);
    await _box.put(model.hex, model);
  }

  @override
  Future<ColorEntity?> findById(String id) async {
    final model = _box.get(id);

    return model?.toEntity();
  }

  @override
  Future<List<ColorEntity>> findAll() async {
    final colors = _box.values.map((model) => model.toEntity()).toList();

    colors.sort(
      (a, b) => b.creationDate.compareTo(a.creationDate),
    );

    return colors;
  }

  @override
  Future<List<ColorEntity>> findPage({
    required int page,
    int limit = 20,
  }) async {
    final colors = await findAll();

    final start = page * limit;

    if (start >= colors.length) {
      return [];
    }

    final end = (start + limit).clamp(0, colors.length);

    return colors.sublist(start, end);
  }

  @override
  Future<void> update(ColorEntity entity) async {
    final color = ColorModel.fromEntity(entity);
    await _box.put(color.hex, color);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  // Future<void> clear() async {
  //   await _box.clear();
  // }

  @override
  Stream<BoxEvent> watch() {
    return _box.watch();
  }
}
