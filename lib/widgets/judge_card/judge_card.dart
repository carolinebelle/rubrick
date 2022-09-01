import 'package:flutter/material.dart';
import 'package:rubrick/components/grade_box.dart';
import 'package:rubrick/widgets/judge_card/judge_column.dart';

import '../../components/rounded_border.dart';
import 'category.dart';
import 'judge_tracker.dart';

class JudgeCard extends StatefulWidget {
  final List<String> judges = [for (int i = 0; i < 8; i++) "Judge $i"];
  final List<String> categories = [
    "Achievements",
    "Technical Ability",
    "Academic Potential",
    "Personality"
  ];
  JudgeCard({Key? key}) : super(key: key);

  @override
  State<JudgeCard> createState() => _JudgeCardState();
}

class _JudgeCardState extends State<JudgeCard> {
  int turn = 0;
  int category = 0;
  @override
  Widget build(BuildContext context) {
    return RoundedBorder(
      group: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            JudgeTracker(turn),
            for (int i = 0; i < widget.categories.length; i++)
              Category(
                  title: widget.categories[i],
                  judges: widget.judges,
                  category: category,
                  turn: turn)
          ],
        ),
      ),
    );
  }
}
