import 'package:flutter/material.dart';
import 'package:rubrick/pages/contest_screen.dart';
import 'package:rubrick/widgets/side_drawer.dart';

import 'colors/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness brightness = Brightness.light;

  @override
  void initState() {
    super.initState();
    final window = WidgetsBinding.instance.window;

    window.onPlatformBrightnessChanged = () {
      brightness = window.platformBrightness;
    };
    WidgetsBinding.instance.handlePlatformBrightnessChanged();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(contestID: 'Fellows 2022-23'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String contestID;

  const MyHomePage({Key? key, required this.contestID}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _actionButtonPress() {
    print("To be implemented");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ContestScreen(contestID: widget.contestID),
      floatingActionButton: FloatingActionButton(
        onPressed: _actionButtonPress,
        tooltip: 'End your turn',
        child: const Icon(Icons.campaign),
      ),
    );
  }
}
