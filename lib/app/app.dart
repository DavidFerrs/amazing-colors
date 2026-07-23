import 'package:amazing_colors/app/modules/home/data/repository/color_repository_impl.dart';
import 'package:amazing_colors/app/modules/home/domain/repository/color_repository.dart';
import 'package:amazing_colors/app/modules/home/domain/usecases/get_history_usecase.dart';
import 'package:amazing_colors/app/modules/home/domain/usecases/save_color_usecase.dart';
import 'package:amazing_colors/app/modules/home/presentation/bloc/color_cubit.dart';
import 'package:amazing_colors/app/modules/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive_ce.dart';

/// The main class of the app when initializes
class App extends StatefulWidget {
  /// Creates an [App]
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

/// The state of the main App
class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final ColorRepository repository = ColorRepositoryImpl(Hive.box('colors'));

    return MaterialApp(
      home: BlocProvider(
        create: (_) => ColorCubit(
          saveColorUseCase: SaveColorUseCase(repository),
          getHistoryUseCase: GetHistoryUseCase(repository),
        ),
        child: const HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Hive.close();
    super.dispose();
  }
}
