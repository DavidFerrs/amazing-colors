import 'package:amazing_colors/app/modules/home/data/models/color_model.dart';
import 'package:amazing_colors/app/modules/home/data/repository/color_repository_impl.dart';
import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';
import 'package:amazing_colors/app/modules/home/domain/usecases/get_history_usecase.dart';
import 'package:amazing_colors/app/modules/home/domain/usecases/save_color_usecase.dart';
import 'package:amazing_colors/app/modules/home/presentation/bloc/color_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  group('ColorCubit', () {
    ColorCubit? colorCubit;
    // ignore: avoid_late_keyword
    late ColorRepository repository;

    setUp(() async {
      final box = await Hive.openBox<ColorModel>('colors_test');
      repository = ColorRepositoryImpl(box);
      colorCubit = ColorCubit(
        getHistoryUseCase: GetHistoryUseCase(repository),
        saveColorUseCase: SaveColorUseCase(repository),
      );
    });

    tearDown(() {
      colorCubit?.close();
    });

    test('Check if intialize correctly', () {
      expect(colorCubit?.state, const ColorState.initial());
    });

    blocTest<ColorCubit, ColorState>(
      'Emits a state diferent from the initial one',
      build: () => ColorCubit(
        getHistoryUseCase: GetHistoryUseCase(repository),
        saveColorUseCase: SaveColorUseCase(repository),
      ),
      act: (cubit) => cubit.changeBackgroundColor(),
      expect: () => isNot(const ColorState.initial()),
    );
  });
}
