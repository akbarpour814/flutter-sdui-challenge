import 'package:flutter_sdui_challenge/configs/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.init();
  await initializeHive();
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(RateSongModelAdapter().typeId)) {
  //   Hive.registerAdapter(RateSongModelAdapter());
  // }
  // Hive.deleteBoxFromDisk(hiveDBNameUpdate);
}
