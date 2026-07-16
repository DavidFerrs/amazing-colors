import 'package:amazing_colors/app/modules/home/presentation/bloc/color_cubit.dart';
import 'package:amazing_colors/app/modules/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (_) => ColorCubit(),
        child: const HomePage(),
      ),
    ),
  );
}
