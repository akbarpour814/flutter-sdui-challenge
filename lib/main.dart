import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/configs/theme_config.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/screens/car_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter-sdui-challenge',
      theme: themeConfig(context),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: CarListScreen()),
    );
  }
}
