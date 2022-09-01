import 'package:flutter/material.dart';

class DetailedGrade extends StatefulWidget {
  final bool revealed;
  const DetailedGrade({Key? key, required this.revealed}) : super(key: key);

  @override
  State<DetailedGrade> createState() => _DetailedGradeState();
}

class _DetailedGradeState extends State<DetailedGrade> {
  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;

    return Visibility(
      visible: widget.revealed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "A+",
            style: text.headline6,
          ),
          Text("- Note", style: text.bodySmall)
        ],
      ),
    );
  }
}
