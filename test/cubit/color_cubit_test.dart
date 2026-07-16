import 'package:amazing_colors/app/modules/home/presentation/bloc/color_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorCubit', () {
    ColorCubit? colorCubit;

    setUp(() {
      colorCubit = ColorCubit();
    });

    tearDown((){
      colorCubit?.close();
    });

    test('Check if intialize correctly', (){
      expect(colorCubit?.state, const ColorState.initial());
    });

    blocTest<ColorCubit, ColorState>(
      'Emits a state diferent from the initial one',
      build: ColorCubit.new,
      act: (cubit) => cubit.changeBackgroundColor(),
      expect: () => isNot(const ColorState.initial()),
    );
  });
}
