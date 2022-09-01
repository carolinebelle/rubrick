import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rubrick/pages/contest_screen.dart';
import 'package:rubrick/widgets/side_drawer.dart';

import 'colors/color_scheme.dart';
import 'pages/round_table.dart';
import 'responsive/dimensions.dart';
import 'widgets/rankable_list.dart';

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
  bool myTurn = false;
  bool rankingAvailable = true;
  bool groupScreenAvailable =
      (window.physicalSize.height / window.devicePixelRatio) > 500;
  void _actionButtonPress() {
    print("To be implemented");
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Widget mobileBody = Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const SideDrawer(),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ContestScreen(contestID: widget.contestID),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (myTurn)
            FloatingActionButton(
              heroTag: "turn",
              onPressed: _actionButtonPress,
              tooltip: 'End your turn',
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              child: const Icon(Icons.campaign),
            ),
          if (rankingAvailable)
            FloatingActionButton(
              heroTag: "rank",
              onPressed: () {
                _gotoRankingPage(context);
              },
              tooltip: 'Adjust rankings',
              backgroundColor: colorScheme.onBackground,
              foregroundColor: colorScheme.onPrimaryContainer,
              child: const Icon(Icons.format_list_numbered),
            ),
        ],
      ),
    );

    Widget desktopBody = Scaffold(
      backgroundColor: colorScheme.background,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.tertiary.withAlpha(100),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const SideDrawer(),
            ),
          ),
          Flexible(
            flex: 3,
            child: ContestScreen(contestID: widget.contestID),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (myTurn)
            FloatingActionButton(
              heroTag: "turn",
              onPressed: _actionButtonPress,
              tooltip: 'End your turn',
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
              child: const Icon(Icons.campaign),
            ),
          if (groupScreenAvailable)
            FloatingActionButton(
              heroTag: "group",
              onPressed: () {
                _gotoRoundTablePage(context);
              },
              tooltip: 'Round table',
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              child: const Icon(Icons.people),
            ),
          if (groupScreenAvailable && rankingAvailable) SizedBox(height: 10),
          if (rankingAvailable)
            FloatingActionButton(
              heroTag: "rank",
              onPressed: () {
                _gotoRankingPage(context);
              },
              tooltip: 'Adjust rankings',
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              child: const Icon(Icons.format_list_numbered),
            ),
        ],
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }

  void _gotoRankingPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Finalize Order"),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          body: const RankableList(
            cloudRankings: [
              "Greene",
              "Abramoqickldf",
              "John",
              "LSmith",
              "Tupak",
              "Lfdsf",
              "Orian",
              "Hernandez",
              "Turner",
              "Hutchinson",
              "Blimey",
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "yes",
                onPressed: _actionButtonPress,
                tooltip: 'Yes',
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: const Icon(Icons.thumb_up),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "no",
                onPressed: _actionButtonPress,
                tooltip: 'No',
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Theme.of(context).colorScheme.onTertiary,
                child: const Icon(Icons.thumb_down),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoRoundTablePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Round Table"),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          body: const RoundTable(),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "yes",
                onPressed: _actionButtonPress,
                tooltip: 'Yes',
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: const Icon(Icons.thumb_up),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "no",
                onPressed: _actionButtonPress,
                tooltip: 'No',
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                foregroundColor: Theme.of(context).colorScheme.onTertiary,
                child: const Icon(Icons.thumb_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* Overall state changes: 
  live discussion rank button, Icons.format_list_numbered
  end your turn button, Icons.campaign
  vote button , 
*/