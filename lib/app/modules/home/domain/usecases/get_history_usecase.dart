import 'package:amazing_colors/app/modules/home/domain/entities/color_entity.dart';
import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';
/// Usecase responsible for fetching the history of generated colors.
///
/// This usecase will fetch all the colors from the repository.
class GetHistoryUseCase {
  final ColorRepository _repository;
  /// Creates a [GetHistoryUseCase] with the provided [ColorRepository].
  const GetHistoryUseCase(this._repository);

  /// Fetch the history using the repository.
  Future<List<ColorEntity>> call() {
    return _repository.findAll();
  }
}
