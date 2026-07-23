import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';
/// Usecase responsible for toggling the favorite state of a color.
///
/// Given a color identifier, this usecase will fetch the color from the
/// repository, flip its `isFavorite` flag and persist the updated color.
class FavoriteColorUsecase {
  /// Repository used to read and update colors.
  final ColorRepository _repository;

  /// Creates a [FavoriteColorUsecase] with the provided [ColorRepository].
  const FavoriteColorUsecase(this._repository);

  /// Toggle the favorite status for the color with the given [id].
  ///
  /// Throws an [Exception] if the color isn't found in the repository.
  Future<void> call(String id) async {
    final color = await _repository.findById(id);

    if (color == null) {
      throw Exception('Color not found');
    }

    color.copyWith(isFavorite: !color.isFavorite);

    await _repository.update(color);
  }
}
