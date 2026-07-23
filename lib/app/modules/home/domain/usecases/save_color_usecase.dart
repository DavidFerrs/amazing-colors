import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';

/// Use case responsible for saving a [ColorEntity].
///
/// Delegates the save operation to the provided [ColorRepository].
class SaveColorUseCase {
  final ColorRepository _repository;

  /// Creates a [SaveColorUseCase] with the given repository.
  const SaveColorUseCase(this._repository);

  /// Saves the provided [entity] using the repository.
  Future<void> call(ColorEntity entity) async {
    await _repository.save(entity);
  }
}
