import 'package:flutter/material.dart';

import 'colors/color_scheme.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Brightness brightness;

  @override
  void initState() {
    super.initState();
    final window = WidgetsBinding.instance.window;

    window.onPlatformBrightnessChanged = () {
      brightness = window.platformBrightness;
    };
    WidgetsBinding.instance.handlePlatformBrightnessChanged();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuBrick',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        textTheme: Typography.blackCupertino,
        unselectedWidgetColor: Colors.white,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: Typography.whiteCupertino,
        unselectedWidgetColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const Navigation(),
    );
  }
}
