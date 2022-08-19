import 'package:flutter/material.dart';
import 'package:rubrick/widgets/side_drawer.dart';

void main() {
  runApp(const MyApp());
}

const Color blackColor = Color.fromARGB(255, 0, 0, 0);
const Color darkColor = Color.fromARGB(255, 28, 48, 74);
const Color mediumColor = Color.fromARGB(255, 4, 107, 153);
const Color brightColor = Color.fromARGB(255, 255, 126, 126);
const Color lightColor = Color.fromARGB(255, 179, 239, 255);
const Color whiteColor = Color.fromARGB(255, 255, 255, 255);

ColorScheme defaultColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: mediumColor,
  onPrimary: darkColor,
  primaryContainer: mediumColor.withAlpha(100),
  onPrimaryContainer: darkColor,
  secondary: brightColor,
  onSecondary: darkColor,
  secondaryContainer: brightColor.withAlpha(100),
  onSecondaryContainer: darkColor,
  tertiary: lightColor,
  onTertiary: darkColor,
  tertiaryContainer: lightColor.withAlpha(100),
  onTertiaryContainer: darkColor,
  background: whiteColor,
  onBackground: darkColor,
  surface: mediumColor.withAlpha(10),
  onSurface: darkColor,
  surfaceVariant: brightColor.withAlpha(10),
  onSurfaceVariant: darkColor,
  outline: mediumColor,
  shadow: darkColor,
  inverseSurface: mediumColor,
  onInverseSurface: whiteColor,
  inversePrimary: whiteColor,
  surfaceTint: whiteColor.withAlpha(100),
  error: brightColor,
  onError: whiteColor,
  errorContainer: brightColor.withAlpha(100),
  onErrorContainer: blackColor,
);
ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: mediumColor,
  onPrimary: darkColor,
  primaryContainer: mediumColor.withAlpha(100),
  onPrimaryContainer: darkColor,
  secondary: brightColor,
  onSecondary: darkColor,
  secondaryContainer: brightColor.withAlpha(100),
  onSecondaryContainer: darkColor,
  tertiary: lightColor,
  onTertiary: darkColor,
  tertiaryContainer: lightColor.withAlpha(100),
  onTertiaryContainer: darkColor,
  background: darkColor,
  onBackground: whiteColor,
  surface: mediumColor.withAlpha(10),
  onSurface: darkColor,
  surfaceVariant: brightColor.withAlpha(10),
  onSurfaceVariant: darkColor,
  outline: mediumColor,
  shadow: darkColor,
  inverseSurface: mediumColor,
  onInverseSurface: whiteColor,
  inversePrimary: whiteColor,
  surfaceTint: whiteColor.withAlpha(100),
  error: brightColor,
  onError: whiteColor,
  errorContainer: brightColor.withAlpha(100),
  onErrorContainer: blackColor,
);

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

    // This callback is called every time the brightness changes.
    window.onPlatformBrightnessChanged = () {
      // print(
      // "Brightness is dark: ${window.platformBrightness == Brightness.dark}");
      brightness = window.platformBrightness;
    };
    WidgetsBinding.instance.handlePlatformBrightnessChanged();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Inter', colorScheme: defaultColorScheme),
      darkTheme: ThemeData(fontFamily: 'Inter', colorScheme: darkColorScheme),
      home: const MyHomePage(id: 'ContestID'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String id;

  const MyHomePage({Key? key, required this.id}) : super(key: key);

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.id,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _actionButtonPress,
        tooltip: 'End your turn',
        child: const Icon(Icons.campaign),
      ),
    );
  }
}
