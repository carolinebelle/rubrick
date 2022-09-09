import 'package:flutter/material.dart';

import 'colors/color_scheme.dart';
import 'navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase/setup.dart';

const bool USE_EMULATOR = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (USE_EMULATOR) await connectToFirebaseEmulator();

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
