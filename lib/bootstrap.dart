import 'dart:async';

import 'package:amazing_colors/app/modules/home/data/models/color_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Creates the initial configuration off the aplication before initializes
///
/// - Local Storage
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  // final widgetsBinding = 
  WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(ColorModelAdapter());

  // if (!Hive.isBoxOpen('colors')) {
    await Hive.openBox<ColorModel>('colors');
    // await Hive.deleteFromDisk();
  // }

  runApp(await builder());
}
