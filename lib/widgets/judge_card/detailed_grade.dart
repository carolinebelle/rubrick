import 'package:flutter/material.dart';

class DetailedGrade extends StatefulWidget {
  const DetailedGrade({Key? key}) : super(key: key);

  @override
  State<DetailedGrade> createState() => _DetailedGradeState();
}

class _DetailedGradeState extends State<DetailedGrade> {
  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        "A+",
        style: text.headline6,
      ),
      Text("- Note", style: text.bodySmall)
    ]);
  }
}
