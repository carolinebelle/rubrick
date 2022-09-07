import 'package:flutter/material.dart';

class JudgeTracker extends StatefulWidget {
  const JudgeTracker(int turn, {Key? key}) : super(key: key);

  @override
  State<JudgeTracker> createState() => _JudgeTrackerState();
}

class _JudgeTrackerState extends State<JudgeTracker> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 90),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Divider(color: colors.primary, thickness: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 8; i++)
                              const Icon(Icons.run_circle_outlined, size: 60)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: colors.primary, thickness: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
