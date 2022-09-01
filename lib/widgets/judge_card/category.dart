import "package:flutter/material.dart";
import 'package:rubrick/components/grade_box.dart';
import 'package:rubrick/widgets/judge_card/detailed_grade.dart';

class Category extends StatefulWidget {
  final String title;
  final List<String> judges;
  final int category;
  final int turn;
  const Category(
      {Key? key,
      required this.title,
      required this.judges,
      required this.category,
      required this.turn})
      : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.title, style: text.headline6),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: GradeBox(
                    grade: "A+",
                    hasBorder: true,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: colors.primary.withAlpha(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        for (int i = 0; i < 8; i++)
                          DetailedGrade(revealed: i % 2 == 0 || i == 3)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
