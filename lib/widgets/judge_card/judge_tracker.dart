import 'package:flutter/material.dart';

class JudgeTracker extends StatefulWidget {
  const JudgeTracker(int turn, {Key? key}) : super(key: key);

  @override
  State<JudgeTracker> createState() => _JudgeTrackerState();
}

class _JudgeTrackerState extends State<JudgeTracker> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
        child: const Text("JudgeTracker"),
      ),
    );
  }
}
