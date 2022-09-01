import 'package:flutter/material.dart';

class JudgeColumn extends StatefulWidget {
  const JudgeColumn({Key? key}) : super(key: key);

  @override
  State<JudgeColumn> createState() => _JudgeColumnState();
}

class _JudgeColumnState extends State<JudgeColumn> {
  int achievement = -1;
  int technicalAbility = -1;
  int academicPotential = -1;
  int personality = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}
